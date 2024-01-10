//
//  BerlinClockModel.swift
//  BerlinClock
//
//  Created by LoaclUser on 10/01/24.
//

import Foundation

class BerlinClockModel {
   
    func checkSecondsLamp(seconds: Int) -> String{
        return ((seconds % 2) == 0) ? "Y" : "O"
    }
    
    func checkBottomOneMinuteLamp(minute: Int) -> String{
        if (minute % 5) == 1 {
            return "YOOO"
        }
        if (minute % 5) == 2 {
            return "YYOO"
        }
        
        return "OOOO"
    }
    
}
