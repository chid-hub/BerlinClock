//
//  BerlinClockModel.swift
//  BerlinClock
//
//  Created by LoaclUser on 10/01/24.
//

import Foundation

class BerlinClockModel {
   
    func convertToBerlinTime(_ time: String) -> String {
        let components = time.components(separatedBy: ":")
        
        guard components.count == 3,
              let hours = Int(components[0]),
              let minutes = Int(components[1]),
              let seconds = Int(components[2]) else {
            return "Invalid time format"
        }
        
        let secondsLamp = checkSecondsLamp(seconds: seconds)
        let topHoursLamps = checkTopFiveHourLamp(hour: hours)
        let bottomHoursLamps = checkBottomOneHourLamp(hour: hours)
        let topMinutesLamps = checkTopFiveMinuteLamp(minute: minutes)
        let bottomMinutesLamps = checkBottomOneMinuteLamp(minute: minutes)
        
        let berlinTime = "\(secondsLamp) \(topHoursLamps) \(bottomHoursLamps) \(topMinutesLamps) \(bottomMinutesLamps)"
        
        return berlinTime
    }
    
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
        for i in 0..<(hour % 5) {
            char[i] = "R"
        }
        return char.joined()
    }
    
    func checkTopFiveHourLamp(hour: Int) -> String{
        var char = Array(repeating: "O", count: 4)
        for i in 0..<(hour / 5) {
            char[i] = "R"
        }
        return char.joined()
    }
    
}
