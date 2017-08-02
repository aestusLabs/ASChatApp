//
//  ChatButton.swift
//  ChatAppOrigionalFiles
//
//  Created by Ian Kohlert on 2017-07-19.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
import UIKit

class ChatButton: UIButton {
    var buttonTag: WidgetTagNames = .error
    let gradient = CAGradientLayer()
    override init (frame: CGRect) {
        super.init(frame: frame)
        
        
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOpacity = 0.25
        self.layer.shadowOffset = CGSize(width: 2, height: 4)
        self.layer.shadowRadius = 4
//        gradient.frame = self.bounds
//        
//        let red = UIColor(red: 1.0, green: 0.28627451, blue: 0.568627451, alpha: 1.0)
//        let orange = UIColor(red: 1.0, green: 0.462745098, blue: 0.462745098, alpha: 1.0)
//        gradient.colors = [red.cgColor, orange.cgColor]
//        
//        gradient.startPoint = CGPoint.zero
//        gradient.endPoint = CGPoint(x: 1, y: 1)
//        self.layer.insertSublayer(gradient, at: 0)

//        self.layer.borderColor = appColours.getMainAppColour().cgColor
//        self.layer.borderWidth = 1
        self.backgroundColor = appColours.getMainAppColour() //UIColor.white
        self.layer.cornerRadius = 18
        self.setTitleColor(UIColor.white, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: UIFontWeightBold)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
}



func createChatButton(text: String, tag: WidgetTagNames) -> ChatButton{
    let button = ChatButton(frame: CGRect(x: 0, y: 0, width: 250, height: 40))
    button.setTitle(text, for: .normal)
    button.buttonTag = tag
    
    return button
}
