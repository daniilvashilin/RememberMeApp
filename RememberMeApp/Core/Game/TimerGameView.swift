//
//  TimerGameView.swift
//  RememberMeApp
//
//  Created by Daniil on 05/12/2024.
//

import SwiftUI

struct TimerGameView: View {
    @State private var timeElapsed: Double = 0.0 // Time that done
    @Binding var isRuning: Bool // Indicator for is rinning
    
    // Formating the time to normal time format 00:00:00
    private var formatedTime: String {
        let minutes = Int(timeElapsed) / 60
        let seconds = Int(timeElapsed) % 60
        let milliseconds = Int((timeElapsed - Double(Int(timeElapsed))) * 100)
        return String(format: "%02d:%02d.%02d", minutes, seconds, milliseconds)
    }
    
    private func setupTimer() {
        Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { timer in
            if isRuning {
                timeElapsed += 0.01
            }
        }
    }
        
        var body: some View {
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 100)
                        .fill(.black)
                        .frame(width: 200, height: 50)
                    Text(formatedTime)
                        .font(.headline)
                        .foregroundStyle(.white)
                }
            }
            .onAppear(perform: setupTimer)
        }
    }


struct TimerGame_Preivew: PreviewProvider {
    static var previews: some View {
        TimerGameView(isRuning: .constant(true))
    }
}
