//
//  BerlinClockLampsView.swift
//  BerlinClock
//
//  Created by LoaclUser on 12/01/24.
//

import SwiftUI

struct BerlinClockLampsView: View {
    
     var berlinClockLamps: BerlinClockLamps

    var body: some View {
           VStack(spacing: 8) {
       
               SecondsLampView(lamp: berlinClockLamps.second)

               HStack {
                   ForEach(berlinClockLamps.topHours, id: \.self) { lamp in
                       LampView(lamp: lamp)
                   }
               }
               HStack {
                   ForEach(berlinClockLamps.bottomHours, id: \.self) { lamp in
                       LampView(lamp: lamp)
                   }
               }
               HStack {
                   ForEach(berlinClockLamps.topMinutes, id: \.self) { lamp in
                       FiveMinuteLampView(lamp: lamp)
                   }
               }
               HStack {
                   ForEach(berlinClockLamps.bottomMinutes, id: \.self) { lamp in
                       LampView(lamp: lamp)
                   }
               }
           }
           .foregroundColor(.white)
       }
}

struct BerlinClockLampsView_Previews: PreviewProvider {
    static var previews: some View {
        BerlinClockLampsView(berlinClockLamps: BerlinClockLamps())
    }
}
