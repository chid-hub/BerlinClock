//
//  LampView.swift
//  BerlinClock
//
//  Created by LoaclUser on 12/01/24.
//

import SwiftUI

struct LampView: View {
    let lamp: Lamp

    var body: some View {
        RoundedRectangle(cornerRadius: 5)
            .fill(lamp.color)
            .frame(width: 50, height: 25)
            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.white, lineWidth: 1))
    }
}

struct LampView_Previews: PreviewProvider {
    static var previews: some View {
        LampView(lamp: .red)
    }
}
