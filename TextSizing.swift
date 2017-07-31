//
//  TextSizing.swift
//  ChatAppOrigionalFiles
//
//  Created by Ian Kohlert on 2017-07-19.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
import UIKit

struct TextSizing {
    var chatTextSize: CGFloat = 16
    var chatFontWeight = UIFontWeightMedium
    var chatFont = UIFont.systemFont(ofSize: 16, weight: UIFontWeightMedium)
    
    func getWidthOf(chatText: String) -> CGFloat {
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 1000, height: 50))
        label.font = UIFont.systemFont(ofSize: 16, weight: chatFontWeight)
        
        label.text = chatText
        label.sizeToFit()
        
        return label.frame.width
    }
    
    func getTextLabelSize(text: String, screenWidth: CGFloat) -> (width: CGFloat, height: CGFloat) {
        var width = getWidthOf(chatText: text)
        
        if width > screenWidth - 80 {
            width = screenWidth - 80
        }
        let height = text.height(withConstrainedWidth: width, font: chatFont)
        return (width, height)
    }
    
}
let textSizingFunctions = TextSizing()
