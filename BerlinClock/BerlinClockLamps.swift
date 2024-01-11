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
    var second: Lamp = .off
    var topHours: [Lamp] = Array(repeating: .off, count: 4)
    var bottomHours: [Lamp] = Array(repeating: .off, count: 4)
    var topMinutes: [Lamp] = Array(repeating: .off, count: 11)
    var bottomMinutes: [Lamp] = Array(repeating: .off, count: 4)
    
}
