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
        XCTAssertEqual("O", berlinClock.checkSecondsLamp(seconds: 0))
    }
    func testSecondsLamp_On(){
        XCTAssertEqual("Y", berlinClock.checkSecondsLamp(seconds: 2))
    }
    
    func testBottom1MinutesLamp_AllOff(){
        XCTAssertEqual("OOOO", berlinClock.checkBottomOneMinuteLamp(minute: 0))
    }
}
