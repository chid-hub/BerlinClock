//
//  DateExtensions.swift
//  BerlinClock
//
//  Created by LoaclUser on 12/01/24.
//

import Foundation

extension Date {
    static func fromString(_ dateString: String, format: String = "yyyy-MM-dd HH:mm:ss") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: dateString)
    }

    func toString(format: String = "HH:mm:ss") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
