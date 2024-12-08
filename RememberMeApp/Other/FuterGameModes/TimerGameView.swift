//
//  TimerGameView.swift
//  RememberMeApp
//
//  Created by Daniil on 05/12/2024.
//

import SwiftUI

struct TimerGameView: View {
    @Binding var isRuning: Bool
    @Binding var timeElapsedResualt: Double

    private var formattedTime: String {
        timeElapsedResualt.formattedTime()
    }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 100)
                .fill(.black)
                .frame(width: 200, height: 50)
            Text(formattedTime)
                .font(.headline)
                .foregroundStyle(.white)
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
                if isRuning {
                    timeElapsedResualt += 0.1
                }
            }
        }
    }
}
struct TimerGame_Preivew: PreviewProvider {
    static var previews: some View {
        TimerGameView(isRuning: .constant(true), timeElapsedResualt: .constant(0))
    }
}
