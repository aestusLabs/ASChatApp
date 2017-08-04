//
//  ChatViewController.swift
//  ChatAppOrigionalFiles
//
//  Created by Ian Kohlert on 2017-07-19.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController, UITextFieldDelegate {

    
    var chatView = ChatView()
    
    
    var maxYOfLastWidget: CGFloat = 0
    var scrollViewContentHeight: CGFloat = 0
    
    var activeButtons: [ChatButton] = [] // this is for disabling buttons once no longer in user
    var currentWidget = allWidgets.allAppsWidgets.askName   //.askName //listOfWidgets.askChangeDepth  //: Widget? = nil
    var initialHHS: HHSNames = .onboarding
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("########")

       chatView = createChatView(screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)
        self.view.addSubview(chatView)
        displayOpeningMessages(name: initialHHS)
        
        chatView.textField.delegate = self
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    
    func displayOpeningMessages(name: HHSNames) {
        let widgets = chatManager.getCurrentHHSWidgets()
        for widget in widgets {
            print(widget.tag)
        updateUIFor(widget: widget)
        }

    }
    
    func swipeBackToContent(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        if recognizer.state == .recognized {
            print("!!")
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "ContentVC") as! ContentViewController
            //                        newViewController.screenTap()
            self.present(newViewController, animated: true, completion: nil)
        }
    }
    
    // MARK INPUT
    
    
    func sendInputToTriage(input: String, viewInput: UIView?, tag: WidgetTagNames) {
        print(scrollViewContentHeight)
        var activeWidgetTapped = false
        if currentWidget.tag == tag { //converTagNumberToName(tagNumber: tag) {
            activeWidgetTapped = true
        }
        let result = triageUserInput(input: input, viewInput: viewInput, tag: tag, activeWidgetTapped: activeWidgetTapped)
        dealWithTriage(result: (result.widget, result.vc))
    }
    
    func tappedWidget(sender: UITapGestureRecognizer) {
                let sessionView = sender.view as! SessionWidget

        sendInputToTriage(input: "", viewInput: sender.view, tag: sessionView.tagName)
// if this doesn't work then create a subclass of UIView with a tag property than use that to subclass modules
        
        
        
//        let sessionView = sender.view as! SessionWidget
//        if let title = sessionView.title.text {
//        let triageString = "\(title) \(sessionView.length)"
//            sendInputToTriage(input: triageString, viewInput: sender.view, tag: sessionView.tagName)
//
//        }
//        print("Triage String \(triageString)")
//        if let tag = sender.view?.tag {
//            sendInputToTriage(input: triageString, tag: tag)
//        }
    }

    func tapAction(sender: ChatButton) {
        print("@@@@@@@@")
        print(sender.buttonTag)
        
        sender.backgroundColor = appColours.getMainAppColour()
//        sender.layer.borderColor = UIColor.white.cgColor
        
        for button in activeButtons {
            if button.tag == sender.tag {
                button.backgroundColor = UIColor.lightGray
               // button.layer.borderColor = appColours.getMainAppColour().cgColor
                button.setTitleColor(UIColor.darkGray, for: .normal)
                button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: UIFontWeightBold)
            }
        }
       
        if sender.tag != 100 {
            
            sender.backgroundColor = appColours.getMainAppColour()
//            sender.layer.borderColor = UIColor.white.cgColor
            sender.setTitleColor(UIColor.white, for: .normal)
            sender.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: UIFontWeightBold)
        }
        
        if let title = sender.titleLabel?.text {
            sendInputToTriage(input: title, viewInput: nil, tag: sender.buttonTag)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let textFieldText = textField.text {
            let textSize = textSizingFunctions.getTextLabelSize(text: textFieldText, screenWidth: self.view.frame.width)
            let bubble = createChatBubble(text: textFieldText, textWidth: textSize.width, textHeight: textSize.height, isUser: true)
            scrollViewContentHeight += bubble.frame.height + 10
            chatView.scrollView.addSubview(bubble)
            arrangeChatBubble(bubble: bubble, isUser: true)
            textField.text = ""
            sendInputToTriage(input: textFieldText, viewInput: nil, tag: currentWidget.tag) //getValueFor(widgetTagName: currentWidget.tagName))
        }
        return true
    }
    
    // MARK ACTION ON RESULT OF INPUT
    
    func dealWithTriage(result: (widget: [Widget]?, vc: VCName?)) {
        
        if let widgets = result.widget {
            
            for widget in widgets {
            
            if widget.tag != currentWidget.tag {
                updateUIFor(widget: widget)
                // MARK Need to do some testing here. I don't think I need the below line.
//                chatView.scrollView.contentOffset = CGPoint(x: 0, y: maxYOfLastWidget - chatView.scrollView.frame.height  + 45)
            }
            currentWidget = widget
            }
        }
        if let vcName = result.vc {
            navigateTo(vc: vcName) // moved to Extension
//            if vcName == .content {
//                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//                let newViewController = storyBoard.instantiateViewController(withIdentifier: "ContentVC") as! ContentViewController
//                //                        newViewController.screenTap()
//                self.present(newViewController, animated: true, completion: nil)
//            }
        }
    }
    


    
    func keyboardShows(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            print(keyboardSize)
            print("@@@")
            chatView.textField.center.y = self.view.frame.height - keyboardSize.height - chatView.textField.frame.height / 2
            chatView.scrollView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - keyboardSize.height)
            chatView.scrollView.contentOffset = CGPoint(x: 0, y: maxYOfLastWidget - chatView.scrollView.frame.height  + 45)

        }
    }
    
    func keyboardHides(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            UIView.animate(withDuration: 0.25, animations: { 
            self.chatView.textField.center.y = self.view.frame.height - self.chatView.textField.frame.height / 2
            })
            
            chatView.scrollView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - chatView.textField.frame.height)
            if maxYOfLastWidget > self.view.frame.height - 45 {
            chatView.scrollView.contentOffset = CGPoint(x: 0, y: maxYOfLastWidget - chatView.scrollView.frame.height  + 35)
            } else {
                UIView.animate(withDuration: 0.25, animations: { 
                    self.chatView.scrollView.contentOffset = CGPoint(x: 0, y: 0)
                })
                
            }

            //            textField.isEnabled = false
        }
    }
    
    

  
}
