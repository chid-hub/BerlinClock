//
//  DigitalClockView.swift
//  BerlinClock
//
//  Created by LoaclUser on 12/01/24.
//

import SwiftUI

struct DigitalClockView: View {
    let timeInput: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.blue.opacity(0.1))
                .frame(width: 200, height: 60)
                .shadow(radius: 5)
            
            Text(timeInput)
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .foregroundColor(.blue)
        }
        .padding()
    }
}

struct DigitalClockView_Previews: PreviewProvider {
    static var previews: some View {
        DigitalClockView(timeInput: "10:10:10")
    }
}
