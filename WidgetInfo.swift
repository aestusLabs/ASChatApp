//
//  WidgetInfo.swift
//  ChatAppOrigionalFiles
//
//  Created by Ian Kohlert on 2017-07-25.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation



struct UpdatedModule {
    var type: String
}



//func getWelcomeMessageInfo() {
//    
//}

func getWhatIsThisTextFor(widgetTag: WidgetTagNames) {
    
}

enum AnswerFormats {
    case yesNo, textInput, presentedButtons, presentedModules, sessionWidgets, chooseDaysOfWeek
    case none
    // yes/no buttons are fed a function and send the bool to the function
}

struct Widget {
    var tag: WidgetTagNames
    var answerFormat: AnswerFormats
    var hhBarText: String
}



func test() {
    
}

