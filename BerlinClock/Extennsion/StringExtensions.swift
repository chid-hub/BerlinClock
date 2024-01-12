//
//  StringExtensions.swift
//  BerlinClock
//
//  Created by LoaclUser on 12/01/24.
//

import Foundation

extension String {
    func toDate(format: String = "HH:mm:ss") -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self) ?? Date()
    }
}
