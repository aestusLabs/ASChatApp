//
//  ChatVCAddWidgetsExtension.swift
//  ChatAppOrigionalFiles
//
//  Created by Ian Kohlert on 2017-07-31.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
import UIKit

extension ChatViewController {
    func updateUIFor(widget: Widget) {
        
        
        let widgetText = getTextFor(widgetTag: widget.tag)
        addChatTextToScrollView(text: widgetText)
        print(widget.answerFormat)
        
        if widget.answerFormat == .presentedButtons {
            
            
            let buttonTitles = getButtonTitlesFor(widgetTag: widget.tag)
            
            for button in buttonTitles {
                
                addChatButtonToScrollView(buttonTitle: button, widget: widget)
                
            }
            
            
        }  else if widget.answerFormat == .sessionWidgets {
            print("Session widgets")
            let modules = getModulesFor(widgetTag: widget.tag)
            for module in modules {
                print(module)
                
                addSessionWidgetModuleToScrollView(title: module.title, image: module.image, text: "", time: "\(module.length)m", numberOfDots: module.inhale, widget: widget)
            }
            
        } else if widget.answerFormat == .chooseDaysOfWeek {
            addChooseDaysOfWeekModuleToScrollView(widget: widget)
        }
        
        // any button/enter on the keyboard needs to run the widget function
        // update HHBar
        // answer format dicates if I need to add buttons below the helper chat bubble
        
    }
    
    func addChooseDaysOfWeekModuleToScrollView(widget: Widget) {
        
        let daysOfWeekLetter = ["mo", "tu", "we", "th", "fr", "sa", "su"]
        var arrayOfDayButtons: [ChooseDayOfWeekButton] = []
        for day in daysOfWeekLetter {
            let button = createChooseDayOfWeekButton(text: day, tag: widget.tag)
            print(button.buttonTag)
            button.addTarget(self, action: #selector(self.tapAction(sender:)), for: .touchUpInside)
            arrayOfDayButtons.append(button)
            chatView.scrollView.addSubview(button)
        }
        arrangeDaysOfWeekButtons(widgets: arrayOfDayButtons)
        
        addChatButtonToScrollView(buttonTitle: "add notifications", widget: widget)
        //        let module = createDailyReminderCard(screenWidth: self.view.frame.width)
        //        self.view.addSubview(module)
        //        arrangeHelperWidgets(widget: module)
        //        scrollViewContentHeight += module.frame.height + 10
    }
    
    func addSessionWidgetModuleToScrollView(title: String, image: UIImage, text: String, time: String, numberOfDots: Int, widget: Widget) {
        print("add session widget")
        let module = createSessionWidget(screenWidth: self.view.frame.width, title: title, image: image, text: text, time: time, numberOfDots: numberOfDots, tag: widget.tag)
        //        module.tag = getValueFor(widgetTagName: widget.tagName)
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tappedSessionWidget(sender:)))
        module.addGestureRecognizer(tap)
        chatView.scrollView.addSubview(module)
        arrangeHelperWidgets(widget: module)
        scrollViewContentHeight += module.frame.height + 10
        
    }
    
    func addChatTextToScrollView(text: String) {
        
        let textSize = textSizingFunctions.getTextLabelSize(text: text, screenWidth: self.view.frame.width)
        let bubble = createChatBubble(text: text, textWidth: textSize.width, textHeight: textSize.height, isUser: false)
        chatView.scrollView.addSubview(bubble)
        arrangeChatBubble(bubble: bubble, isUser: false)
        scrollViewContentHeight += bubble.frame.height + 10
    }
    
    
    
    func addChatButtonToScrollView(buttonTitle: String, widget: Widget) {
        let button = createChatButton(text: buttonTitle, tag: widget.tag)
        
        //        button.tag = getValueFor(widgetTagName: widget.tagName)
        button.addTarget(self, action: #selector(self.tapAction(sender:)), for: .touchUpInside)
        activeButtons.append(button)
        //        addTapTo(button: button)
        chatView.scrollView.addSubview(button)
        arrangeHelperWidgets(widget: button)
        scrollViewContentHeight += button.frame.height + 10
        
    }

}
