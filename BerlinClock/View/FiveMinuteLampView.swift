//
//  FiveMinuteLampView.swift
//  BerlinClock
//
//  Created by LoaclUser on 12/01/24.
//

import SwiftUI

struct FiveMinuteLampView: View {
    let lamp: Lamp

    var body: some View {
        RoundedRectangle(cornerRadius: 5)
            .fill(lamp.color)
            .frame(width: 13, height: 25)
            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.white, lineWidth: 1))
    }
}

struct FiveMinuteLampView_Previews: PreviewProvider {
    static var previews: some View {
        FiveMinuteLampView(lamp: .red)
    }
}
