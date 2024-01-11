//
//  BerlinClockLampsModel.swift
//  BerlinClock
//
//  Created by LoaclUser on 11/01/24.
//

import Foundation

struct BerlinClockLamps {
    var second: String = "O"
    var topHours: [String] = ["O","O","O","O"]
    var bottomHours: [String] = ["O","O","O","O"]
    var topMinutes: [String] = ["O","O","O","O","O","O","O","O","O","O","O"]
    var bottomMinutes: [String] = ["O","O","O","O"]
    
    func integrateSecondMinuteAndHour()-> String{
        let secondsLamp = self.second
        let topHoursLamps = self.topHours.joined()
        let bottomHoursLamps = self.bottomHours.joined()
        let topMinutesLamps = self.topMinutes.joined()
        let bottomMinutesLamps = self.bottomMinutes.joined()
        
        let berlinTime = "\(secondsLamp) \(topHoursLamps) \(bottomHoursLamps) \(topMinutesLamps) \(bottomMinutesLamps)"
        
        return berlinTime
    }
}
