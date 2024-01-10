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
    func testTop5MinutesLamp_FirstOn(){
        XCTAssertEqual("YOOOOOOOOOO", berlinClock.checkTopFiveMinuteLamp(minute: 5))
    }
    func testTop5MinutesLamp_FirstAndSecondOn(){
        XCTAssertEqual("YYOOOOOOOOO", berlinClock.checkTopFiveMinuteLamp(minute: 10))
    }
    func testTop5MinutesLamp_FirstQuarterOn(){
        XCTAssertEqual("YYROOOOOOOO", berlinClock.checkTopFiveMinuteLamp(minute: 15))
    }
    func testTop5MinutesLamp_AllQuarterOn(){
        XCTAssertEqual("YYRYYRYYROO", berlinClock.checkTopFiveMinuteLamp(minute: 45))
    }
    func testTop5MinutesLamp_AllOn(){
        XCTAssertEqual("YYRYYRYYRYY", berlinClock.checkTopFiveMinuteLamp(minute: 55))
    }
    
    func testTopOneHourLamp_AllOff(){
        XCTAssertEqual("OOOO", berlinClock.checkBottomOneHourLamp(hour: 0))
    }
    func testTopOneHourLamp_FirstOn(){
        XCTAssertEqual("ROOO", berlinClock.checkBottomOneHourLamp(hour: 6))
    }
    
    func testTopOneHourLamp_FirstAndSecondOn(){
        XCTAssertEqual("RROO", berlinClock.checkBottomOneHourLamp(hour: 7))
    }
    func testTopOneHourLamp_AllOn(){
        XCTAssertEqual("RRRR", berlinClock.checkBottomOneHourLamp(hour: 9))
    }

    func testTop5HourLamp_AllOff(){
        XCTAssertEqual("OOOO", berlinClock.checkTopFiveHourLamp(hour: 0))
    }
    func testTop5HourLamp_FirstOn(){
        XCTAssertEqual("ROOO", berlinClock.checkTopFiveHourLamp(hour: 5))
    }
    func testTop5HourLamp_FirstAndSecondOn(){
        XCTAssertEqual("RROO", berlinClock.checkTopFiveHourLamp(hour: 10))
    }
    func testTop5HourLamp_AllOn(){
        XCTAssertEqual("RRRR", berlinClock.checkTopFiveHourLamp(hour: 20))
    }
    
}
