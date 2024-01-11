//
//  BerlinClockModel.swift
//  BerlinClock
//
//  Created by LoaclUser on 10/01/24.
//

import Foundation

class BerlinClockModel {
   
    func convertToBerlinTime(_ time: String) -> BerlinClockLamps {
        let components = time.components(separatedBy: ":")
        
        guard components.count == 3,
              let hours = Int(components[0]),
              let minutes = Int(components[1]),
              let seconds = Int(components[2]) else {
            return BerlinClockLamps()
        }
        
        let secondsLamp = checkSecondsLamp(seconds: seconds)
        let topHoursLamps = checkTopFiveHourLamp(hour: hours).map({ String($0) })
        let bottomHoursLamps = checkBottomOneHourLamp(hour: hours).map({ String($0) })
        let topMinutesLamps = checkTopFiveMinuteLamp(minute: minutes)
        let bottomMinutesLamps = checkBottomOneMinuteLamp(minute: minutes)
        
        let berlinClockLamps = BerlinClockLamps(second: secondsLamp, topHours: topHoursLamps, bottomHours: bottomHoursLamps, topMinutes:topMinutesLamps, bottomMinutes: bottomMinutesLamps)
            
        return berlinClockLamps
    }
    
    func checkSecondsLamp(seconds: Int) -> String{
        return ((seconds % 2) == 0) ? "Y" : "O"
    }
    
    func checkBottomOneMinuteLamp(minute: Int) -> [String]{
        return (0..<4).map { $0 < (minute % 5) ? "Y" : "O"}
    }
    
    func checkTopFiveMinuteLamp(minute: Int) -> [String]{
        var fiveMinuteLamp = Array(repeating: "O", count: 11)
        for i in 0..<(minute / 5) {
            fiveMinuteLamp[i] = ((i + 1) % 3) == 0 ? "R": "Y"
        }
        return fiveMinuteLamp
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
