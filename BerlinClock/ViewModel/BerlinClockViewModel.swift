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
    private var timer: Timer?

    private let berlinClockModel = BerlinClockModel()

    func convertToBerlinTime(_ date: Date) {
        timeInput = date.toString()
        berlinClockLamps = berlinClockModel.convertToBerlinTime(date)
    }
}

extension BerlinClockViewModel {
    
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                self.convertToBerlinTime(Date())
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}
