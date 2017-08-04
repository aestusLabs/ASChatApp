//
//  TriageAllAppsWidgets.swift
//  breathe by aestus.health
//
//  Created by Ian Kohlert on 2017-08-02.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
func checkAllAppCases(input: String, tag: WidgetTagNames, activeWidgetTapped: Bool) -> (widget: [Widget]?, vc: VCName?) {
    switch tag {
    case .askName:
        ASUser.name = input
        return (getHHS.onboarding(), nil)
        
    // MARK Notificatioins
    case .askAddDailyNotification:
        if input == "yes" {
            if ASUser.permissionToSendNotifications == false {
                askPermissionToSendNotifications()
            }
            return ([allWidgets.allAppsWidgets.askTimeToSetNotifcation], nil)
        }
        
    case .askTimeForNotification:
        // set temp time with input
        let parsedTime = parseTime(text: input)
        if parsedTime.valid {
            notificationToAdd.parsedHour = parsedTime.hour
            notificationToAdd.parsedMinute = parsedTime.minute
            return ([allWidgets.allAppsWidgets.askDaysToSetNotification], nil)
            
        } else {
            return ([allWidgets.allAppsWidgets.invalidTime], nil)
        }
        
    case .invalidTime:
        let parsedTime = parseTime(text: input)
        if parsedTime.valid {
            notificationToAdd.parsedHour = parsedTime.hour
            notificationToAdd.parsedMinute = parsedTime.minute
            return ([allWidgets.allAppsWidgets.askDaysToSetNotification], nil)
            
        } else {
            return ([allWidgets.allAppsWidgets.invalidTime], nil)
        }
        
        
    case .askDaysForNotification:
        //        input the days
        switch input {
        case "mo":
            notificationToAdd.mon = !notificationToAdd.mon
        case "tu":
            notificationToAdd.tue = !notificationToAdd.tue
        case "we":
            notificationToAdd.wed = !notificationToAdd.wed
        case "th":
            notificationToAdd.thu = !notificationToAdd.thu
        case "fr":
            notificationToAdd.fri = !notificationToAdd.fri
        case "sa":
            notificationToAdd.sat = !notificationToAdd.sat
        case "su":
            notificationToAdd.sun = !notificationToAdd.sun
        default:
            print("Error")
        }
        if input == "add notifications" {
            let hour = notificationToAdd.parsedHour
            let minutes = notificationToAdd.parsedMinute
            if notificationToAdd.mon {
                scheduleDailyNotification(notificationContent: notificationContent.mondayNotification, dayNumber: 2, hour: hour, minutes: minutes, requestIdentifier: requestIdentifiers.dailyReminderMonday)
            }
            if notificationToAdd.tue {
                scheduleDailyNotification(notificationContent: notificationContent.tuesdayNotification, dayNumber: 3, hour: hour, minutes: minutes, requestIdentifier: requestIdentifiers.dailyReminderTuesday)
            }
            if notificationToAdd.wed {
                scheduleDailyNotification(notificationContent: notificationContent.wednesdayNotification, dayNumber: 4, hour: hour, minutes: minutes, requestIdentifier: requestIdentifiers.dailyReminderWednesday)
            }
            if notificationToAdd.thu {
                scheduleDailyNotification(notificationContent: notificationContent.thursdayNotification, dayNumber: 5, hour: hour, minutes: minutes, requestIdentifier: requestIdentifiers.dailyReminderThursday)
            }
            
            if notificationToAdd.fri {
                scheduleDailyNotification(notificationContent: notificationContent.fridayNotification, dayNumber: 6, hour: hour, minutes: minutes, requestIdentifier: requestIdentifiers.dailyReminderFriday)
            }
            if notificationToAdd.sat {
                scheduleDailyNotification(notificationContent: notificationContent.saturdayNotification, dayNumber: 7, hour: hour, minutes: minutes, requestIdentifier: requestIdentifiers.dailyReminderSaturday)
            }
            
            if notificationToAdd.sun {
                scheduleDailyNotification(notificationContent: notificationContent.sundayNotification, dayNumber: 1, hour: hour, minutes: minutes, requestIdentifier: requestIdentifiers.dailyReminderSunday)
            }
            
            
            return ([allWidgets.allAppsWidgets.askIfTheyWantToSetAnother], nil)
        }
    case .askAddAnother:
        if input == "yes" {
            return ([allWidgets.allAppsWidgets.askTimeToSetNotifcation], nil)
        } else {
            return (getCurrentHHS(), nil)
            
        }
        
    // MARK Settings
    case .showAllSettings:
        switch input {
        case "contact developer":
            return ([allWidgets.allAppsWidgets.contactDeveloper], nil)
        case "rate the app":
            print("Rate")
        case "subscribe":
            return ([allWidgets.allAppsWidgets.subscribe], nil)
        case "tell your friends":
            print("Tell friends")
        default:
            print("Error Show All Settings")
        }
    default:
        print("Not in all apps widget triage")
    }
    return (nil, nil)
}
