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


struct AllWidgets {
    let welcomeMessage = Widget(tag: .welcomeMessage, answerFormat: .none, hhBarText: "")
    let startNewSession = Widget(tag: .newSession, answerFormat: .presentedButtons, hhBarText: "")
    let showSettings = Widget(tag: .showAllSettings, answerFormat: .presentedButtons, hhBarText: "")
    let sessionSuggestions = Widget(tag: .sessionSuggestions, answerFormat: .sessionWidgets, hhBarText: "")
    let askFamiliarWithBreathingExercises = Widget(tag: .askFamiliar, answerFormat: .presentedButtons, hhBarText: "")
    let breathDepth = Widget(tag: .breathDepth, answerFormat: .presentedButtons, hhBarText: "")
    let sessionLength = Widget(tag: .sessionLength, answerFormat: .presentedButtons, hhBarText: "")
    let askName = Widget(tag: .askName, answerFormat: .presentedButtons, hhBarText: "")
    let finishedMessage = Widget(tag: .finishedMessage, answerFormat: .none, hhBarText: "")
    let restart = Widget(tag: .restart, answerFormat: .presentedButtons, hhBarText: "")
    let askChangeLength = Widget(tag: .askChangeLength, answerFormat: .presentedButtons, hhBarText: "")
    let askChangeDepth = Widget(tag: .askChangeDepth, answerFormat: .presentedButtons, hhBarText: "")
    let swipeBackMessage = Widget(tag: .swipeBackMessage, answerFormat: .none, hhBarText: "")
    let resumeSession = Widget(tag: .resumeSession, answerFormat: .presentedButtons, hhBarText: "")
    let switchUpRoutine = Widget(tag: .getSessionSuggestions, answerFormat: .presentedButtons, hhBarText: "")
    let listOfSessionTypes = Widget(tag: .showAllSessionTypes, answerFormat: .presentedButtons, hhBarText: "")
    let askSustain = Widget(tag: .askSustain, answerFormat: .presentedButtons, hhBarText: "")
    let fullLungSustain = Widget(tag: .fullLungsSustain, answerFormat: .presentedButtons, hhBarText: "")
    let emptyLungSustain = Widget(tag: .emptyLungsSustain, answerFormat: .presentedButtons, hhBarText: "")
    let continueOn = Widget(tag: .continueOn, answerFormat: .presentedButtons, hhBarText: "")
    let askGoalForSession = Widget(tag: .askGoalForSession, answerFormat: .presentedButtons, hhBarText: "")
    
    let focusExercies = Widget(tag: .focusExercises, answerFormat: .presentedButtons, hhBarText: "")
    let energyExercises = Widget(tag: .energyExercies, answerFormat: .presentedButtons, hhBarText: "")
    let calmExercises = Widget(tag: .calmExercises, answerFormat: .presentedButtons, hhBarText: "")
    
    let chooseExhale = Widget(tag: .exhale, answerFormat: .presentedButtons, hhBarText: "")
    
    // MARK notifications
    let askAddDailyNotification = Widget(tag: .askAddDailyNotification, answerFormat: .presentedButtons, hhBarText: "")
    let askTimeToSetNotifcation = Widget(tag: .askTimeForNotification, answerFormat: .presentedButtons, hhBarText: "")
    let askDaysToSetNotification = Widget(tag: .askDaysForNotification, answerFormat: .chooseDaysOfWeek, hhBarText: "")
    let askIfTheyWantToSetAnother = Widget(tag: .askAddAnother, answerFormat: .presentedButtons, hhBarText: "")
    
    let invalidTime = Widget(tag: .invalidTime, answerFormat: .none, hhBarText: "")
    
    
    // MARK Settings
    let showAllNotifications = Widget(tag: .showAllSettings, answerFormat: .presentedButtons, hhBarText: "")
    let contactDeveloper = Widget(tag: .contactDeveloper, answerFormat: .presentedButtons, hhBarText: "")
    let rateTheApp = Widget(tag: .rateTheApp, answerFormat: .presentedButtons, hhBarText: "")
    let subscribe = Widget(tag: .subscribe, answerFormat: .presentedButtons, hhBarText: "")
    let tellYourFriends = Widget(tag: .tellYourFriends, answerFormat: .presentedButtons, hhBarText: "")
}
let allWidgets = AllWidgets()

func test() {
    
}

