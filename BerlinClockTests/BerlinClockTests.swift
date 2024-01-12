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
        let date = "00:00:01".toDate()
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("O", lamps.second.rawValue)
    }
    func testSecondsLamp_On(){
        let date = "00:00:02".toDate()
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("Y", lamps.second.rawValue)
    }
    
    func testBottom1MinutesLamp_AllOff(){
        let date = "00:00:00".toDate()
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("OOOO", lamps.bottomMinutes.map({$0.rawValue}).joined())
    }
    func testBottom1MinutesLamp_FirstOn(){
        let date = "00:01:00".toDate()
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("YOOO", lamps.bottomMinutes.map({$0.rawValue}).joined())
    }
    func testBottom1MinutesLamp_FirstAndSecondOn(){
        let date = "00:02:01".toDate()
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("YYOO", lamps.bottomMinutes.map({$0.rawValue}).joined())
    }
    func testBottom1MinutesLamp_FirstAndSecondAndThirdOn(){
        let date = "00:03:01".toDate()
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("YYYO", lamps.bottomMinutes.map({$0.rawValue}).joined())
    }
    func testBottom1MinutesLamp_AllOn(){
        let date = "00:04:01".toDate()
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("YYYY", lamps.bottomMinutes.map({$0.rawValue}).joined())
    }
    
    func testTop5MinutesLamp_AllOff(){
        let date = "00:00:00".toDate()
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("OOOOOOOOOOO", lamps.topMinutes.map({$0.rawValue}).joined())
    }
    func testTop5MinutesLamp_FirstOn(){
        let date = "00:05:00".toDate()
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("YOOOOOOOOOO", lamps.topMinutes.map({$0.rawValue}).joined())
    }
    func testTop5MinutesLamp_FirstAndSecondOn(){
        let date = "00:10:00".toDate()
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("YYOOOOOOOOO", lamps.topMinutes.map({$0.rawValue}).joined())
    }
    func testTop5MinutesLamp_FirstQuarterOn(){
        let date = "00:15:00".toDate()
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("YYROOOOOOOO", lamps.topMinutes.map({$0.rawValue}).joined())
    }
    func testTop5MinutesLamp_AllQuarterOn(){
        let date = "00:45:00".toDate()
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("YYRYYRYYROO", lamps.topMinutes.map({$0.rawValue}).joined())
    }
    func testTop5MinutesLamp_AllOn(){
        let date = "00:55:00".toDate()
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("YYRYYRYYRYY", lamps.topMinutes.map({$0.rawValue}).joined())
    }
    
    func testTopOneHourLamp_AllOff(){
        let date = "00:00:00".toDate()
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("OOOO", lamps.bottomHours.map({$0.rawValue}).joined())
    }
    func testTopOneHourLamp_FirstOn(){
        let date = "06:00:00".toDate()
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("ROOO", lamps.bottomHours.map({$0.rawValue}).joined())
    }
    
    func testTopOneHourLamp_FirstAndSecondOn(){
        let date = "07:00:00".toDate()
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("RROO", lamps.bottomHours.map({$0.rawValue}).joined())
    }
    func testTopOneHourLamp_AllOn(){
        let date = "09:00:00".toDate()
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("RRRR", lamps.bottomHours.map({$0.rawValue}).joined())
    }

    func testTop5HourLamp_AllOff(){
        let date = "00:00:00".toDate()
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("OOOO", lamps.topHours.map({$0.rawValue}).joined())
    }
    func testTop5HourLamp_FirstOn(){
        let date = "05:00:00".toDate()
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("ROOO", lamps.topHours.map({$0.rawValue}).joined())
    }
    func testTop5HourLamp_FirstAndSecondOn(){
        let date = "10:00:00".toDate()
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("RROO", lamps.topHours.map({$0.rawValue}).joined())
    }
    func testTop5HourLamp_AllOn(){
        let date = "20:00:00".toDate()
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("RRRR", lamps.topHours.map({$0.rawValue}).joined())
    }
    
    func testIntegrateSecondMinuteAndHour_AllLampOff(){
        let date = "00:00:01".toDate()
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("O OOOO OOOO OOOOOOOOOOO OOOO", integrateSecondMinuteAndHour(lamps: lamps))
    }
    func testIntegrateSecondMinuteAndHour_SecondsLampOn(){
        let date = "00:00:00".toDate()
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("Y OOOO OOOO OOOOOOOOOOO OOOO", integrateSecondMinuteAndHour(lamps: lamps))
    }
    func testIntegrateSecondMinuteAndHour_MaximumHoursLampOn(){
        let date = "23:00:01".toDate()
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("O RRRR RRRO OOOOOOOOOOO OOOO", integrateSecondMinuteAndHour(lamps: lamps))
    }
    func testIntegrateSecondMinuteAndHour_AllMinutesLampOn(){
        let date = "00:59:59".toDate()
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("O OOOO OOOO YYRYYRYYRYY YYYY", integrateSecondMinuteAndHour(lamps: lamps))
    }
    func testIntegrateSecondMinuteAndHour_MaximumLampOn(){
        let date = "23:59:59".toDate()
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("O RRRR RRRO YYRYYRYYRYY YYYY", integrateSecondMinuteAndHour(lamps: lamps))    }
    
}

extension BerlinClockTests{
    
    func integrateSecondMinuteAndHour(lamps: BerlinClockLamps)-> String{
        let secondsLamp = lamps.second.rawValue
        let topHoursLamps = lamps.topHours.map({$0.rawValue}).joined()
        let bottomHoursLamps = lamps.bottomHours.map({$0.rawValue}).joined()
        let topMinutesLamps = lamps.topMinutes.map({$0.rawValue}).joined()
        let bottomMinutesLamps = lamps.bottomMinutes.map({$0.rawValue}).joined()
        
        let berlinTime = "\(secondsLamp) \(topHoursLamps) \(bottomHoursLamps) \(topMinutesLamps) \(bottomMinutesLamps)"
        
        return berlinTime
    }
}
