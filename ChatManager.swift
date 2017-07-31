//
//  ChatManager.swift
//  ChatAppOrigionalFiles
//
//  Created by Ian Kohlert on 2017-07-24.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation

enum PathNames {
    case none, onboarding, newSession, contentSuggestions
}

struct ChatManager {
    var currentPath: PathNames = .none
    var currentHHS: HHSNames = .home
    
    func getCurrentHHSWidgets() -> [Widget] {
        if currentHHS == .onboarding {
//            updateUIFor(widget: allWidgets.askName)
            return [allWidgets.askName]
        }
        if currentHHS == .home {
            let widgets = getHHS.home()
            return widgets
//            for widget in widgets {
//                updateUIFor(widget: widget)
//            }
            
//            chatView.textField.resignFirstResponder()
        }
        if currentHHS == .finished {
            let widgets = getHHS.finished()
            return widgets
//            for widget in widgets {
//                updateUIFor(widget: widget)
//            }
//            chatView.textField.resignFirstResponder()
        }
        if currentHHS == .content {
//            let swipeBack = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(self.swipeBackToContent))
//            swipeBack.edges = .left
//            view.addGestureRecognizer(swipeBack)
            let widgets = getHHS.content()
            return widgets
//            for widget in widgets {
//                updateUIFor(widget: widget)
//                
//            }
//            chatView.textField.resignFirstResponder()
        }
        return []
    }
}
var chatManager = ChatManager()
