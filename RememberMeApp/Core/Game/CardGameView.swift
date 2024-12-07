//
//  CardGameView.swift
//  RememberMeApp
//
//  Created by Daniil on 04/12/2024.
//

import SwiftUI

struct CardGameView: View {
    @State private var isRunningGame = false
    @State private var isGameStarted = false
    @State var cardingValue: Int
    @Binding var stopGame: Bool
    @State private var currentNumberOfCards: Int = 0
    @EnvironmentObject private var userDataModel: UserDataModel
    var body: some View {
        VStack {
            HStack {
                // Timer
                TimerGameView(isRuning: $isGameStarted)
                Spacer()
                // current/count cards
                Text("\(currentNumberOfCards)/\(cardingValue)")
                    .font(.headline)
                Spacer()
                // End game button
                
                Button {
                    stopGame = false
                } label: {
                    Image(systemName: "xmark.rectangle.fill")
                        .foregroundStyle(.red)
                        .font(.title)
                }
                
                // Pause button
                
                Button {
                     isGameStarted.toggle()
                } label: {
                    Image(systemName: isGameStarted ? "pause.rectangle.fill" : "play.rectangle.fill")
                        .font(.title)
                        .foregroundStyle(isGameStarted ? .blue : .green)
                }
               

            }
            .padding()
            Spacer()
        }
       
    }
}


struct CardGame_Preview: PreviewProvider {
    static var previews: some View {
        CardGameView(cardingValue: 50, stopGame: .constant(false))
    }
}
