//
//  BerlinClockViewModel.swift
//  BerlinClock
//
//  Created by LoaclUser on 12/01/24.
//

import Foundation

import Foundation
import SwiftUI

class BerlinClockViewModel: ObservableObject {
    @Published var timeInput: String = ""
    @Published var berlinClockLamps: BerlinClockLamps = BerlinClockLamps()

    private let berlinClockModel = BerlinClockModel()

    func convertToBerlinTime() {
        berlinClockLamps = berlinClockModel.convertToBerlinTime(timeInput)
    }

    func updateCurrentTime() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        timeInput = dateFormatter.string(from: Date())
        convertToBerlinTime()
    }
}
