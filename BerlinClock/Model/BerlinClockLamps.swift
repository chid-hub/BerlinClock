//
//  BerlinClockLampsModel.swift
//  BerlinClock
//
//  Created by LoaclUser on 11/01/24.
//

import Foundation
import SwiftUI

enum Lamp: String{
   case off = "O"
   case red = "R"
   case yellow = "Y"
    
    var color: Color {
        switch self {
        case .off:
            return .gray
        case .red:
            return .red
        case .yellow:
            return .yellow
        }
    }
}

struct BerlinClockLamps {
    // initially set all values to off
    var second: Lamp = .off
    var topHours: [Lamp] = Array(repeating: .off, count: AppConstants.numberOfFiveHourLamp)
    var bottomHours: [Lamp] = Array(repeating: .off, count: AppConstants.numberOfOneHourLamp)
    var topMinutes: [Lamp] = Array(repeating: .off, count: AppConstants.numberOfFiveMinuteLamp)
    var bottomMinutes: [Lamp] = Array(repeating: .off, count: AppConstants.numberOfOneMinuteLamp)
}
