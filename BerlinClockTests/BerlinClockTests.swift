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
        let lamps = berlinClock.convertToBerlinTime("00:00:01")
        XCTAssertEqual("O", lamps.second)
    }
    func testSecondsLamp_On(){
        let lamps = berlinClock.convertToBerlinTime("00:00:00")
        XCTAssertEqual("Y", lamps.second)
    }
    
    func testBottom1MinutesLamp_AllOff(){
        let lamps = berlinClock.convertToBerlinTime("00:00:00")
        XCTAssertEqual("OOOO", lamps.bottomMinutes.joined())
    }
    func testBottom1MinutesLamp_FirstOn(){
        let lamps = berlinClock.convertToBerlinTime("00:01:0")
        XCTAssertEqual("YOOO", lamps.bottomMinutes.joined())
    }
    func testBottom1MinutesLamp_FirstAndSecondOn(){
        let lamps = berlinClock.convertToBerlinTime("00:02:01")
        XCTAssertEqual("YYOO", lamps.bottomMinutes.joined())
    }
    func testBottom1MinutesLamp_FirstAndSecondAndThirdOn(){
        let lamps = berlinClock.convertToBerlinTime("00:03:01")
        XCTAssertEqual("YYYO", lamps.bottomMinutes.joined())
    }
    func testBottom1MinutesLamp_AllOn(){
        let lamps = berlinClock.convertToBerlinTime("00:04:01")
        XCTAssertEqual("YYYY", lamps.bottomMinutes.joined())
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
    
    func testIntegrateSecondMinuteAndHour_AllLampOff(){
        let lamps = berlinClock.convertToBerlinTime("00:00:01")
        XCTAssertEqual("O OOOO OOOO OOOOOOOOOOO OOOO", integrateSecondMinuteAndHour(lamps: lamps))
    }
    func testIntegrateSecondMinuteAndHour_SecondsLampOn(){
        let lamps = berlinClock.convertToBerlinTime("00:00:00")
        XCTAssertEqual("Y OOOO OOOO OOOOOOOOOOO OOOO", integrateSecondMinuteAndHour(lamps: lamps))
    }
    func testIntegrateSecondMinuteAndHour_AllHoursOn(){
        let lamps = berlinClock.convertToBerlinTime("24:00:01")
        XCTAssertEqual("O RRRR RRRR OOOOOOOOOOO OOOO", integrateSecondMinuteAndHour(lamps: lamps))
    }
    func testIntegrateSecondMinuteAndHour_AllMinutesLampOn(){
        let lamps = berlinClock.convertToBerlinTime("00:59:59")
        XCTAssertEqual("O OOOO OOOO YYRYYRYYRYY YYYY", integrateSecondMinuteAndHour(lamps: lamps))
    }
    func testIntegrateSecondMinuteAndHour_MaximumLampOn(){
        let lamps = berlinClock.convertToBerlinTime("23:59:59")
        XCTAssertEqual("O RRRR RRRO YYRYYRYYRYY YYYY", integrateSecondMinuteAndHour(lamps: lamps))    }
    
}

extension BerlinClockTests{
    
    func integrateSecondMinuteAndHour(lamps: BerlinClockLamps)-> String{
        let secondsLamp = lamps.second
        let topHoursLamps = lamps.topHours.joined()
        let bottomHoursLamps = lamps.bottomHours.joined()
        let topMinutesLamps = lamps.topMinutes.joined()
        let bottomMinutesLamps = lamps.bottomMinutes.joined()
        
        let berlinTime = "\(secondsLamp) \(topHoursLamps) \(bottomHoursLamps) \(topMinutesLamps) \(bottomMinutesLamps)"
        
        return berlinTime
    }
}
