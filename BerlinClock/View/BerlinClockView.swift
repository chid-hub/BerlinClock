//
//  ContentView.swift
//  BerlinClock
//
//  Created by LoaclUser on 10/01/24.
//

import SwiftUI

struct BerlinClockView: View {
    
    @ObservedObject var viewModel = BerlinClockViewModel()
    
    var body: some View {
        VStack {
            Text("Berlin Clock")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 20)
            

            BerlinClockLampsView(berlinClockLamps: viewModel.berlinClockLamps)
                .frame(width: 150, height: 200)
                .padding()
            
            DigitalClockView(timeInput: viewModel.timeInput)

        }
        .onAppear {
            viewModel.startTimer()
        }
        .onDisappear {
            viewModel.stopTimer()
        }.padding()
    }
}

struct BerlinClockView_Previews: PreviewProvider {
    static var previews: some View {
        BerlinClockView()
    }
}
