//
//  ChatVCArrangeWidgetsExtension.swift
//  ChatAppOrigionalFiles
//
//  Created by Ian Kohlert on 2017-07-31.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
import UIKit
extension ChatViewController {
func arrangeDaysOfWeekButtons(widgets: [UIView]) {
    chatView.scrollView.contentSize = CGSize(width: self.view.frame.width, height: scrollViewContentHeight)
    widgets[3].frame = CGRect(x: 0, y: maxYOfLastWidget + 10, width: widgets[3].frame.width, height: widgets[3].frame.height)
    widgets[3].center.x = self.view.center.x
    
    widgets[2].frame = CGRect(x: widgets[3].frame.minX - 10 - widgets[2].frame.width, y:  maxYOfLastWidget + 10, width: widgets[2].frame.width, height: widgets[2].frame.height)
    widgets[1].frame = CGRect(x: widgets[2].frame.minX - 10 - widgets[1].frame.width, y:  maxYOfLastWidget + 10, width: widgets[1].frame.width, height: widgets[1].frame.height)
    widgets[0].frame = CGRect(x: widgets[1].frame.minX - 10 - widgets[0].frame.width, y:  maxYOfLastWidget + 10, width: widgets[0].frame.width, height: widgets[0].frame.height)
    
    widgets[4].frame = CGRect(x: widgets[3].frame.maxX + 10 , y:  maxYOfLastWidget + 10, width: widgets[4].frame.width, height: widgets[4].frame.height)
    widgets[5].frame = CGRect(x: widgets[4].frame.maxX + 10 , y:  maxYOfLastWidget + 10, width: widgets[5].frame.width, height: widgets[5].frame.height)
    widgets[6].frame = CGRect(x: widgets[5].frame.maxX + 10 , y:  maxYOfLastWidget + 10, width: widgets[6].frame.width, height: widgets[6].frame.height)
    
    
    
    maxYOfLastWidget += widgets[3].frame.height + 10
    
    
    
    if maxYOfLastWidget > chatView.scrollView.frame.height - 35 {
        //            scrollView.contentOffset = CGPoint(x: 0, y: maxYOfLastWidget - scrollView.frame.height + widget.frame.height + 5 )
        chatView.scrollView.contentSize = CGSize(width: self.view.frame.width, height: maxYOfLastWidget + 50)
        
        chatView.scrollView.contentOffset = CGPoint(x: 0, y: maxYOfLastWidget - chatView.scrollView.frame.height + 10)
    }
}

func arrangeHelperWidgets(widget: UIView) {
    chatView.scrollView.contentSize = CGSize(width: self.view.frame.width, height: scrollViewContentHeight)
    print("Hit arrangeHelperWidgets")
    print(scrollViewContentHeight)
    widget.frame = CGRect(x: 0, y: maxYOfLastWidget + 10, width: widget.frame.width, height: widget.frame.height)
    print(widget.frame.maxY)
    maxYOfLastWidget += widget.frame.height + 10
    widget.center.x = self.view.center.x
    
    if maxYOfLastWidget > chatView.scrollView.frame.height - 35 {
        //            scrollView.contentOffset = CGPoint(x: 0, y: maxYOfLastWidget - scrollView.frame.height + widget.frame.height + 5 )
        chatView.scrollView.contentSize = CGSize(width: self.view.frame.width, height: maxYOfLastWidget + 50)
        print("Hit maxYofLastWidget > than scroll view height")
        chatView.scrollView.contentOffset = CGPoint(x: 0, y: maxYOfLastWidget - chatView.scrollView.frame.height + 10)
    }
}
func arrangeChatBubble(bubble: ChatBubble, isUser: Bool) {
    chatView.scrollView.contentSize = CGSize(width: self.view.frame.width, height: scrollViewContentHeight)
    
    if isUser {
        bubble.frame = CGRect(x: self.view.frame.width - bubble.frame.width, y: maxYOfLastWidget + 10, width: bubble.frame.width, height: bubble.frame.height)
    } else {
        bubble.frame = CGRect(x: 0, y: maxYOfLastWidget + 10, width: bubble.frame.width, height: bubble.frame.height)
    }
    
    
    maxYOfLastWidget += bubble.frame.height + 10
    if maxYOfLastWidget > chatView.scrollView.frame.height {
        print(bubble.frame.height)
        chatView.scrollView.contentSize = CGSize(width: self.view.frame.width, height: maxYOfLastWidget + 50)
        chatView.scrollView.contentOffset = CGPoint(x: 0, y: maxYOfLastWidget - chatView.scrollView.frame.height + 10)// + bubble.frame.height + 5)
    }
    print(chatView.scrollView.contentSize)
    
}
}
