//
//  CardGameView.swift
//  RememberMeApp
//
//  Created by Daniil on 04/12/2024.
//

import SwiftUI
struct CardGameView: View {
    @StateObject private var gameData: GameDataModel
    @Binding var stopGame: Bool
    @State private var scale: CGFloat = 0.5

    init(cardingValue: Int, stopGame: Binding<Bool>) {
        _gameData = StateObject(wrappedValue: GameDataModel(cardingValue: cardingValue))
        self._stopGame = stopGame
    }

    var body: some View {
        VStack {
            if gameData.showResult == false {
                HStack {
                    // Таймер
                    TimerGameView(isRuning: $gameData.isGameStarted, timeElapsedResualt: $gameData.timeElapsed)
                    Spacer()
                    // Карты
                    Text("\(gameData.currentNumberOfCards)/\(gameData.cardingValue)")
                        .font(.headline)
                    Spacer()
                    // Кнопки управления
                    GameControlsView(isGameStarted: $gameData.isGameStarted, showAlert: $gameData.showAlert)
                        .alert(isPresented: $gameData.showAlert) {
                            Alert(
                                title: Text("End the game?"),
                                message: Text("Are you sure you want to close the game?"),
                                primaryButton: .default(Text("Yes")) { gameData.showResult = true },
                                secondaryButton: .cancel(Text("No"))
                            )
                            
                        }
                }
                .padding()
                Spacer()
            } else {
                Text("Congratulations!")
                    .font(.largeTitle)
                    .foregroundStyle(.black)
                    .scaleEffect(scale)
                                .onAppear {
                                    withAnimation(.spring(response: 0.4, dampingFraction: 0.3, blendDuration: 0)) {
                                        scale = 1.0
                                    }
                                }
                                .padding(.top, 100)
                Spacer()
            }
        }
        .overlay {
            if gameData.showResult {
                GameResultView(
                    formatedTime: gameData.formattedTime,
                    currentNumberOfCards: gameData.currentNumberOfCards,
                    cardingValue: gameData.cardingValue
                ) {
                    stopGame = false
                    gameData.resetGame()
                }
            }
        }
    }
}


struct CardGame_Preview: PreviewProvider {
    static var previews: some View {
        CardGameView(cardingValue: 50, stopGame: .constant(false))
    }
}
