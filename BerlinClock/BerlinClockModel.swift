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
        let topHoursLamps = checkTopFiveHourLamp(hour: hours)
        let bottomHoursLamps = checkBottomOneHourLamp(hour: hours)
        let topMinutesLamps = checkTopFiveMinuteLamp(minute: minutes)
        let bottomMinutesLamps = checkBottomOneMinuteLamp(minute: minutes)
        
        let berlinClockLamps = BerlinClockLamps(second: secondsLamp, topHours: topHoursLamps, bottomHours: bottomHoursLamps, topMinutes:topMinutesLamps, bottomMinutes: bottomMinutesLamps)
            
        return berlinClockLamps
    }
    
}

extension BerlinClockModel {
    
    private func checkSecondsLamp(seconds: Int) -> Lamp{
        return ((seconds % 2) == 0) ? .yellow : .off
    }
    
    private func checkBottomOneMinuteLamp(minute: Int) -> [Lamp]{
        return (0..<4).map { $0 < (minute % 5) ? .yellow : .off}
    }
    
    private func checkTopFiveMinuteLamp(minute: Int) -> [Lamp]{
        var fiveMinuteLamp = Array<Lamp>(repeating: .off, count: 11)
        for i in 0..<(minute / 5) {
            fiveMinuteLamp[i] = ((i + 1) % 3) == 0 ? .red : .yellow
        }
        return fiveMinuteLamp
    }
    
    private func checkBottomOneHourLamp(hour: Int) -> [Lamp]{
        return (0..<4).map { $0 < (hour % 5) ? .red : .off}
    }
    
    private func checkTopFiveHourLamp(hour: Int) -> [Lamp]{
        return (0..<4).map { $0 < (hour / 5) ? .red : .off}
    }
}
