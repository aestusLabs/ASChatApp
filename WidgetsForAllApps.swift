//
//  WidgetsForAllApps.swift
//  breathe by aestus.health
//
//  Created by Ian Kohlert on 2017-08-02.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
struct WidgetsForAllApps{
    // all
    let welcomeMessage = Widget(tag: .welcomeMessage, answerFormat: .none, hhBarText: "", defaultText: "Hey user, I hope you’re having a good day. Here are some hopefully helpful suggestions to get you started.", multipleTextOptions: true, defaultButtonTitles: nil, multipleButtonTitleOptions: false)
    let showSettings = Widget(tag: .showAllSettings, answerFormat: .presentedButtons, hhBarText: "", defaultText: "If you need to change settings:", multipleTextOptions: false, defaultButtonTitles: ["contact developer", "rate the app", "subscribe", "tell your friends" ], multipleButtonTitleOptions: false)
    let askName = Widget(tag: .askName, answerFormat: .presentedButtons, hhBarText: "", defaultText: "What should I call you?", multipleTextOptions: false, defaultButtonTitles: nil, multipleButtonTitleOptions: false)
    let swipeBackMessage = Widget(tag: .swipeBackMessage, answerFormat: .none, hhBarText: "", defaultText: "Resume your session by swiping from the left side of the screen.", multipleTextOptions: false, defaultButtonTitles: nil, multipleButtonTitleOptions: false)
    
    // MARK notifications
    let askAddDailyNotification = Widget(tag: .askAddDailyNotification, answerFormat: .presentedButtons, hhBarText: "", defaultText: "Would you like to add a daily reminder? You can select the days and time you recieve the notification and easily shut it off at any time", multipleTextOptions: false, defaultButtonTitles: ["no","yes"], multipleButtonTitleOptions: false)
    let askTimeToSetNotifcation = Widget(tag: .askTimeForNotification, answerFormat: .presentedButtons, hhBarText: "", defaultText: "Select a time to recieve your notificaiton at. (You can type a custom time as well.)", multipleTextOptions: false, defaultButtonTitles: ["8am", "12pm", "9pm"], multipleButtonTitleOptions: false)
    let askDaysToSetNotification = Widget(tag: .askDaysForNotification, answerFormat: .chooseDaysOfWeek, hhBarText: "", defaultText: "Which days would you like to be reminded on?", multipleTextOptions: false, defaultButtonTitles: nil, multipleButtonTitleOptions: false)
    let askIfTheyWantToSetAnother = Widget(tag: .askAddAnother, answerFormat: .presentedButtons, hhBarText: "", defaultText: "Would you like to add another? My developer likes to be reminded in the morning and evening.", multipleTextOptions: false, defaultButtonTitles: ["yes", "no"], multipleButtonTitleOptions: false)
    
    let invalidTime = Widget(tag: .invalidTime, answerFormat: .none, hhBarText: "", defaultText: "I don't recognize the time you entered. I apologize for my narrow understanding of english. Try writing the time like this: '3', '9pm', or '8:30 a.m.'", multipleTextOptions: false, defaultButtonTitles: nil, multipleButtonTitleOptions: false)
    
    
    // MARK Settings
    let showAllNotifications = Widget(tag: .showAllSettings, answerFormat: .presentedButtons, hhBarText: "", defaultText: "Here are the settings:", multipleTextOptions: false, defaultButtonTitles: ["contact developer", "rate the app", "subscribe", "tell your friends" ], multipleButtonTitleOptions: false)
    let contactDeveloper = Widget(tag: .contactDeveloper, answerFormat: .presentedButtons, hhBarText: "", defaultText: "Contact the developer by:", multipleTextOptions: false, defaultButtonTitles: ["website", "email", "twitter"], multipleButtonTitleOptions: false)
    let rateTheApp = Widget(tag: .rateTheApp, answerFormat: .presentedButtons, hhBarText: "", defaultText: "If you like the app, please rate it. The developer really appreciates it. If you have a bug to tell the dev about please send him an email.", multipleTextOptions: false, defaultButtonTitles: nil, multipleButtonTitleOptions: false)
    let subscribe = Widget(tag: .subscribe, answerFormat: .presentedButtons, hhBarText: "", defaultText: "Take your breathing practise seriously and subscribe. It's just $2 a month and it's easy to unsubscribe. You get so much more than the free tier offers.", multipleTextOptions: false, defaultButtonTitles: ["why a subscription?", "learn what you get", "subscribe"], multipleButtonTitleOptions: false)
    let tellYourFriends = Widget(tag: .tellYourFriends, answerFormat: .presentedButtons, hhBarText: "", defaultText: "Send a link for to the this app to your friends.", multipleTextOptions: false, defaultButtonTitles: nil, multipleButtonTitleOptions: false)
    
    
}
