//
//  BerlinClockModel.swift
//  BerlinClock
//
//  Created by LoaclUser on 10/01/24.
//

import Foundation

class BerlinClockModel {
   
    func checkSecondsLamp(seconds: Int) -> String{
        return ((seconds % 2) == 0) ? "Y" : "O"
    }
    
    func checkBottomOneMinuteLamp(minute: Int) -> String{
        var char = Array(repeating: "O", count: 4)
        for i in 0..<(minute % 5) {
            char[i] = "Y"
        }
        return char.joined()
    }
    
    func checkTopFiveMinuteLamp(minute: Int) -> String{
        var char = Array(repeating: "O", count: 11)
        for i in 0..<(minute / 5) {
            char[i] = ((i + 1) % 3) == 0 ? "R": "Y"
        }
        return char.joined()
    }
    
    func checkBottomOneHourLamp(hour: Int) -> String{
        var char = Array(repeating: "O", count: 4)
        for i in 0..<(hour / 5) {
            char[i] = "R"
        }
        return char.joined()
    }
    
}
