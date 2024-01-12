//
//  BerlinClockModel.swift
//  BerlinClock
//
//  Created by LoaclUser on 10/01/24.
//

import Foundation

struct BerlinClockModel {
   
    func convertToBerlinTime(_ date: Date) -> BerlinClockLamps { // Date input
       
        let time = getTimeComponents(from: date)
        
        let secondsLamp = checkSecondsLamp(seconds: time.seconds)
        let topHoursLamps = checkTopFiveHourLamp(hour: time.hours)
        let bottomHoursLamps = checkBottomOneHourLamp(hour: time.hours)
        let topMinutesLamps = checkTopFiveMinuteLamp(minute: time.minutes)
        let bottomMinutesLamps = checkBottomOneMinuteLamp(minute: time.minutes)
        
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
    
    func getTimeComponents(from date: Date) -> (hours: Int, minutes: Int, seconds: Int) {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour, .minute, .second], from: date)

        let hours = components.hour ?? 0
        let minutes = components.minute ?? 0
        let seconds = components.second ?? 0

        return (hours, minutes, seconds)
    }
}


