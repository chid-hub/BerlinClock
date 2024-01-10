//
//  BerlinClockTests.swift
//  BerlinClockTests
//
//  Created by LoaclUser on 10/01/24.
//

import XCTest
@testable import BerlinClock

final class BerlinClockTests: XCTestCase {

    let berlinClock = BerlinClockModel()
    
    func testSecondsLamp_Off(){
        XCTAssertEqual("O", berlinClock.checkSecondsLamp(secons: 0))
    }
}
