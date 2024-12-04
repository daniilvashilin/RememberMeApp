//
//  TimerView.swift
//  RememberMeApp
//
//  Created by Daniil on 04/12/2024.
//

import SwiftUI

struct TimerView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .frame(width: 130, height: 50)
            HStack {
                Text("00:00")
                    .foregroundStyle(.white)
                    .font(.headline)
                Image(systemName: "clock")
                    .foregroundStyle(.white)
                    .font(.headline)
            }
            .frame(width: 120, height: 50)
        }
    }
}

#Preview {
    TimerView()
}
