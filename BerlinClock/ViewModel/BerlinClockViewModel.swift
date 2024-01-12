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

    func convertToBerlinTime(_ date: Date) {
        berlinClockLamps = berlinClockModel.convertToBerlinTime(date)
    }

    func updateCurrentTime() {
        timeInput = Date().toString()
        convertToBerlinTime(Date())
    }
}
