//
//  BerlinClockLampsModel.swift
//  BerlinClock
//
//  Created by LoaclUser on 11/01/24.
//

import Foundation

enum Lamp: String{
   case off = "O"
   case red = "R"
   case yellow = "Y"
}

struct BerlinClockLamps {
    // initial set all values to off
    var second: Lamp = .off
    var topHours: [Lamp] = Array(repeating: .off, count: AppConstants.numberOfFiveHourLamp)
    var bottomHours: [Lamp] = Array(repeating: .off, count: AppConstants.numberOfOneHourLamp)
    var topMinutes: [Lamp] = Array(repeating: .off, count: AppConstants.numberOfFiveMinuteLamp)
    var bottomMinutes: [Lamp] = Array(repeating: .off, count: AppConstants.numberOfOneMinuteLamp)
}
