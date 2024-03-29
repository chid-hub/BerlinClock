//
//  DateExtensions.swift
//  BerlinClock
//
//  Created by LoaclUser on 12/01/24.
//

import Foundation

extension Date {
    func toString(format: String = "HH:mm:ss") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
