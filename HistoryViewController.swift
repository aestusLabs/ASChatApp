//
//  HistoryViewController.swift
//  breathe by aestus.health
//
//  Created by Ian Kohlert on 2017-08-18.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import UIKit
import CoreData

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {

    let historyCellIdentifier = "historyCellReuseIdentifier"
    var topLabel = UILabel()
    var tableView = UITableView()
    var topBar = UIView()
    var coreDataStack = CoreDataStack(modelName: appInfo.dataModelName) // will need to grab this from elsewhere to make it re-usable
    var managedContext : NSManagedObjectContext!
    var fetchedResultsController: NSFetchedResultsController<History>!
    override func viewDidLoad() {
        super.viewDidLoad()
print(self.view.frame.width)
        // Do any additional setup after loading the view.
        topBar = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 70))
        topBar.backgroundColor = UIColor.white
        self.view.addSubview(topBar)
        
        topLabel = UILabel(frame: CGRect(x: 10, y: topBar.frame.maxY - 45, width: self.view.frame.width, height: 40))
        topLabel.text = "History"
        topLabel.font = UIFont.systemFont(ofSize: 35, weight: UIFontWeightHeavy)
//        topLabel.center.y = topBar.center.y
        
        topLabel.textAlignment = .left
        self.view.addSubview(topLabel)
        
        tableView = UITableView(frame: CGRect(x: 0, y: topBar.frame.maxY, width: self.view.frame.width, height: self.view.frame.height - topBar.frame.height))
        tableView.register(HistoryTableViewCell.self, forCellReuseIdentifier: historyCellIdentifier)
        tableView.rowHeight = 100
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        
        self.view.addSubview(tableView)
        
        let fetchRequest: NSFetchRequest<History> = History.fetchRequest()
        let dateSort = NSSortDescriptor(key: #keyPath(History.date), ascending: false)
        fetchRequest.sortDescriptors = [dateSort]
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: coreDataStack.managedContext, sectionNameKeyPath: nil, cacheName: nil)
       
        fetchedResultsController.delegate = self
        
        
        do {
            try fetchedResultsController.performFetch()
            print(fetchedResultsController)
            
            
        } catch let error as NSError {
            print("Fetching error: \(error), \(error.userInfo)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        print("##")
        guard let sections = fetchedResultsController.sections else {
            return 0
        }
        print(sections.count)
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sectionInfo = fetchedResultsController.sections?[section] else {
print("0")
            return 0
        }
        print(sectionInfo.numberOfObjects)
        return sectionInfo.numberOfObjects
    }
    
    func configure(cell: UITableViewCell, for indexPath: IndexPath) { // this will need to be moved to an app specific place
        // this will send the object to a app specific function and recieve back a view
        guard let cell = cell as? HistoryTableViewCell else {
            return
        }
        let session = fetchedResultsController.object(at: indexPath)
        print(fetchedResultsController.object(at: indexPath))
        print(cell.frame.width)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .short
        cell.dateLabel.text = String(describing: dateFormatter.string(from: session.date! as Date))
        
        // TODO this will need to be be moved to an appSpecific file
        // Have the history cell have a UIView that is filled with a session widget that is created elsewhere
        let widget =  createUpdatedSessionWidgetForHistory(session: session) //createSessionWidgetForHistory(session: session)
        cell.module = widget
//        cell.addSubview(widget)
        
//        cell.sessionWidget.title.text = session.metaData!.sessionType!
//        // below will need to grab the session type and get correct image for that type
//        cell.sessionWidget.imageView.image = #imageLiteral(resourceName: "Lungs")
//        cell.sessionWidget.time.text = "\(session.metaData!.minutesSpent)m"
//        cell.sessionWidget.exhale = 4
    }
    func createSessionWidgetForHistory(session: History) -> SessionWidget{
        let widget = createSessionWidget(screenWidth: self.view.frame.width, title: session.metaData!.sessionType!, image: #imageLiteral(resourceName: "Lungs"), text: "LLALALLLA", time: "\(session.metaData!.minutesSpent)m", numberOfDots: 4, exhale: 1, duration: 49, tag: .calmExercises)
        return widget
    }
    func createUpdatedSessionWidgetForHistory(session: History) -> UpdatedSessionWidget {
        let widget = createUpdatedSessionWidget(screenWidth: self.view.frame.width, title: session.metaData!.sessionType!, image: #imageLiteral(resourceName: "Lungs"), time: "\(session.metaData!.minutesSpent)m", numberOfDots: 3)
        return widget
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: historyCellIdentifier, for: indexPath) as! HistoryTableViewCell
        cell.module.backgroundColor = UIColor.blue

        configure(cell: cell, for: indexPath)
       // cell.textLabel!.text = "HHHHHH"
        print("!!!")
        return cell
    }
    

}
