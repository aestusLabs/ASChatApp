//
//  ChatView.swift
//  ChatAppOrigionalFiles
//
//  Created by Ian Kohlert on 2017-07-31.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
import UIKit

class ChatView: UIView {
    
    var topBar = UIView() // same colour as background
    var topBarText = UILabel()
    var scrollView = UIScrollView()
    var textField = UITextField()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        
        topBar = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 50))
        topBar.backgroundColor = UIColor.white
        self.addSubview(topBar)
        
        topBarText = UILabel(frame: CGRect(x: 10, y: 10, width: self.frame.width, height: 40))
        topBarText.text = "Chat"
        topBarText.font = UIFont.systemFont(ofSize: 35, weight: UIFontWeightHeavy)
        topBarText.center.y = topBar.center.y

        topBarText.textAlignment = .left
        self.addSubview(topBarText)
        
        scrollView = UIScrollView(frame:CGRect(x: 0, y: 50, width: self.frame.width, height: self.frame.height - 50  - 35))
        scrollView.contentSize = CGSize(width: self.frame.width, height: 1000)
        self.addSubview(scrollView)
        
        textField = UITextField(frame: CGRect(x: 0, y: self.frame.maxY - 35, width: self.frame.width, height: 35))
        textField.becomeFirstResponder()
        textField.placeholder = "tap me to chat"
        textField.textAlignment = .center
        textField.backgroundColor = UIColor.white
        textField.returnKeyType = .send
//        textField.delegate = self
        self.addSubview(textField)
        
       
    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
}

func createChatView(screenHeight: CGFloat, screenWidth: CGFloat) -> ChatView {
    let view = ChatView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
    return view
}

//let backgroundImage = UIImageView(frame: self.view.frame)
//backgroundImage.image = #imageLiteral(resourceName: "swirl_pattern")
//backgroundImage.contentMode = .scaleAspectFill
////        backgroundImage.alpha = 0.5
//self.view.addSubview(backgroundImage)
//
//
//scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
//scrollView.contentSize = CGSize(width: self.view.frame.width, height: 1000)
//self.view.addSubview(scrollView)
//
//NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardShows), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
//NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardHides), name: NSNotification.Name.UIKeyboardDidHide, object: nil)
//
//textField = UITextField(frame: CGRect(x: 0, y: self.view.frame.maxY - 35, width: self.view.frame.width, height: 35))
//textField.becomeFirstResponder()
//textField.placeholder = "tap me to chat"
//textField.textAlignment = .center
//textField.backgroundColor = UIColor.white
//textField.returnKeyType = .send
//textField.delegate = self
//self.view.addSubview(textField)
//
//topBar = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50))
////        topBar.backgroundColor = UIColor(red: 0.180392157, green: 0.180392157, blue: 0.180392157, alpha: 1.0)
//let gradient = CAGradientLayer()
//gradient.frame = topBar.bounds
//
//let red = UIColor(red: 1.0, green: 0.28627451, blue: 0.568627451, alpha: 1.0)
//let orange = UIColor(red: 1.0, green: 0.462745098, blue: 0.462745098, alpha: 1.0)
//gradient.colors = [red.cgColor, orange.cgColor]
//
//gradient.startPoint = CGPoint.zero
//gradient.endPoint = CGPoint(x: 1, y: 1)
//topBar.layer.insertSublayer(gradient, at: 0)
//self.view.addSubview(topBar)
//
//let nameLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 20))
//nameLabel.font = UIFont.systemFont(ofSize: 17, weight: UIFontWeightHeavy)
//nameLabel.text = "Ophelia"
//nameLabel.textColor = UIColor.white
//nameLabel.center.y = nameLabel.center.y - 20
//nameLabel.center = topBar.center
//
//self.view.addSubview(nameLabel)
