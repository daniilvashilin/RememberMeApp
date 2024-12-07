//
//  GameDataModel.swift
//  RememberMeApp
//
//  Created by Daniil on 07/12/2024.
//

import Foundation

class GameDataModel: ObservableObject {
    @Published var isGameStarted: Bool = false
    @Published var showAlert: Bool = false
    @Published var showResult: Bool = false
    @Published var currentNumberOfCards: Int = 0
    @Published var timeElapsed: Double = 0.0
    var cardingValue: Int

    init(cardingValue: Int) {
        self.cardingValue = cardingValue
    }

    var formattedTime: String {
        let minutes = Int(timeElapsed) / 60
        let seconds = Int(timeElapsed) % 60
        let milliseconds = Int((timeElapsed - Double(Int(timeElapsed))) * 100)
        return String(format: "%02d:%02d.%02d", minutes, seconds, milliseconds)
    }

    func resetGame() {
        isGameStarted = false
        showAlert = false
        showResult = false
        currentNumberOfCards = 0
        timeElapsed = 0
    }
}
