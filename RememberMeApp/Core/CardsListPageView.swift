//
//  CardsListPageView.swift
//  RememberMeApp
//
//  Created by Daniil on 03/12/2024.
//

import SwiftUI

struct CardsListPageView: View {
    @EnvironmentObject var userDataModel: UserDataModel
    @State private var cards: [Cards] = []
    var deck: CustomUserDeck
    var body: some View {
        VStack {
            List(cards) {cards in
                HStack {
                    Image(.aCard)
                        .resizable()
                        .frame(width: 40, height: 40)
                    VStack(alignment: .leading) {
                        Text("Word: \(cards.word ?? "x")")
                        Text("Translation: \(cards.translate ?? "x")")
                    }
                }
            }
            .listStyle(.plain)
            
        }
        .onAppear {
            cards = userDataModel.fetchCards(for: deck)
        }
    }
}
