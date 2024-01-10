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
        XCTAssertEqual("O", berlinClock.checkSecondsLamp(seconds: 1))
    }
    func testSecondsLamp_On(){
        XCTAssertEqual("Y", berlinClock.checkSecondsLamp(seconds: 2))
    }
    
    func testBottom1MinutesLamp_AllOff(){
        XCTAssertEqual("OOOO", berlinClock.checkBottomOneMinuteLamp(minute: 0))
    }
    func testBottom1MinutesLamp_FirstOn(){
        XCTAssertEqual("YOOO", berlinClock.checkBottomOneMinuteLamp(minute: 1))
    }
    func testBottom1MinutesLamp_FirstAndSecondOn(){
        XCTAssertEqual("YYOO", berlinClock.checkBottomOneMinuteLamp(minute: 2))
    }
    func testBottom1MinutesLamp_FirstAndSecondAndThirdOn(){
        XCTAssertEqual("YYYO", berlinClock.checkBottomOneMinuteLamp(minute: 3))
    }
    func testBottom1MinutesLamp_AllOn(){
        XCTAssertEqual("YYYY", berlinClock.checkBottomOneMinuteLamp(minute: 4))
    }
    
    func testTop5MinutesLamp_AllOff(){
        XCTAssertEqual("OOOOOOOOOOO", berlinClock.checkTopFiveMinuteLamp(minute: 0))
    }
}
