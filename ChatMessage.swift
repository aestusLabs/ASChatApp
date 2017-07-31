//
//  ChatMessage.swift
//  ChatAppOrigionalFiles
//
//  Created by Ian Kohlert on 2017-07-19.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
import UIKit
class ChatBubble: UIView {
    
    var text = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 0.97254902, green: 0.97254902, blue: 0.97254902, alpha: 1.0)
        self.layer.cornerRadius = 2
    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
}

func createChatBubble(text: String, textWidth: CGFloat, textHeight: CGFloat, isUser: Bool) -> ChatBubble{
    
    
    let bubble = ChatBubble(frame: CGRect(x: 0, y: 0, width: 40 + textWidth + 20, height: textHeight + 20))
    if isUser {
        bubble.text = UILabel(frame: CGRect(x: 10, y: 10, width: textWidth, height: textHeight))
        bubble.backgroundColor = appColours.getMainAppColour()
        bubble.text.textColor = UIColor.white
    } else {
        bubble.text = UILabel(frame: CGRect(x: 40, y: 10, width: textWidth, height: textHeight))
    }
    bubble.text.text = text
    bubble.text.numberOfLines = 0
    bubble.text.font = UIFont.systemFont(ofSize: 16, weight: UIFontWeightMedium)
    bubble.text.center.y = bubble.center.y
    bubble.addSubview(bubble.text)
    return bubble
}
