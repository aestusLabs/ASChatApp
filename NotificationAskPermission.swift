//
//  NotificationAskPermission.swift
//  ChatAppOrigionalFiles
//
//  Created by Ian Kohlert on 2017-07-28.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
import UserNotifications

func askPermissionToSendNotifications() {
    UNUserNotificationCenter.current().requestAuthorization(options:
        [[.alert, .sound, .badge]], completionHandler: { (granted, error) in
            
            if !granted {
                print("User did not allow notifications")
            }
    })
}
