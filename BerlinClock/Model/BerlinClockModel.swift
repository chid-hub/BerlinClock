//
//  BerlinClockModel.swift
//  BerlinClock
//
//  Created by LoaclUser on 10/01/24.
//

import Foundation

struct BerlinClockModel {
   
    func convertToBerlinTime(_ date: Date) -> BerlinClockLamps { // Date input
       
        let time = date.toString()
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
        return ((seconds % AppConstants.secondsLampBlinkPer) == 0) ? .yellow : .off
    }
    
    private func checkBottomOneMinuteLamp(minute: Int) -> [Lamp]{
        return (0..<AppConstants.numberOfOneMinuteLamp).map { $0 < (minute % 5) ? .yellow : .off}
    }
    
    private func isQuarterMinute(_ minute: Int) -> Bool {
        return (minute % AppConstants.quartersInFiveMinutesLamp) == 0
    }
    
    private func checkTopFiveMinuteLamp(minute: Int) -> [Lamp] {
        let onLamps: [Lamp] = (0..<(minute / 5)).map { index in
            return isQuarterMinute(index + 1) ? .red : .yellow
        }

        let offLampsCount = max(0, AppConstants.numberOfFiveMinuteLamp - onLamps.count)
        let offLamps = Array<Lamp>(repeating: .off, count: offLampsCount)

        return onLamps + offLamps
    }

    
    private func checkBottomOneHourLamp(hour: Int) -> [Lamp]{
        return (0..<AppConstants.numberOfOneHourLamp).map { $0 < (hour % 5) ? .red : .off}
    }
    
    private func checkTopFiveHourLamp(hour: Int) -> [Lamp]{
        return (0..<AppConstants.numberOfFiveHourLamp).map { $0 < (hour / 5) ? .red : .off}
    }
}


