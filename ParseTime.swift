//
//  ParseTime.swift
//  ChatAppOrigionalFiles
//
//  Created by Ian Kohlert on 2017-07-28.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation

func parseTime(text: String) -> (hour: Int, minute: Int, valid: Bool) {
    var stringHour = ""
    var stringMinutes = ""
    var addTwelve = false
    if text.contains(":") {
        let split = text.components(separatedBy: ":")
        
        if stringIsNumber(text: split[0]) {
            stringHour = split[0]
        }
        if stringIsNumber(text: split[1]) {
            stringMinutes = split[1]
            
        } else {
            if split[1].hasSuffix("am") || split[1].hasSuffix("a.m.") {
                
            } else if split[1].hasSuffix("pm") || split[1].hasSuffix("p.m.") || split[1].hasPrefix("p.m") {
                addTwelve = true
            }
            
            for letter in split[1].characters {
                if stringIsNumber(text: String(letter)) {
                    stringMinutes += String(letter)
                }
            }
        }
        
    } else {
        for letter in text.characters {
            if stringIsNumber(text: String(letter)) {
                stringHour += String(letter)
            }
        }
        if text.hasSuffix("pm") || text.hasSuffix("p.m.") || text.hasPrefix("p.m") {
            addTwelve = true
        }
        
    }
    
    
    var hour = 0
    var minutes = 0
    if let intHour = Int(stringHour) {
        hour = intHour
        if addTwelve {
            hour += 12
        }
    }
    if let intMinutes = Int(stringMinutes) {
        minutes = intMinutes
    }
    var valid = true
    if hour > 24 || hour < 1 {
        valid = false
    } else if minutes > 59 || minutes < 0 {
        valid = false
    }
    return (hour, minutes, valid)
}

func stringIsNumber(text: String) -> Bool {
    if let _ = Int(text) {
        return true
    } else {
        return false
    }
}
