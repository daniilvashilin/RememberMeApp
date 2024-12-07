//
//  CardGameView.swift
//  RememberMeApp
//
//  Created by Daniil on 04/12/2024.
//

import SwiftUI

struct CardGameView: View {
    @State private var isRunningGame = false
    @EnvironmentObject private var userDataModel: UserDataModel
    var body: some View {
        VStack {
            HStack {
                // Timer
                TimerGameView(isRuning: $isRunningGame)
                // current/count cards
                // End game button
            }
            .padding()
            Spacer()
        }
    }
}


struct CardGame_Preview: PreviewProvider {
    static var previews: some View {
        CardGameView()
    }
}
