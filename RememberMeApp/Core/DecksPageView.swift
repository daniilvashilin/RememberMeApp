//
//  DecksPageView.swift
//  RememberMeApp
//
//  Created by Daniil on 03/12/2024.
//

import SwiftUI

struct DecksPageView: View {
    @EnvironmentObject var userDataModel: UserDataModel
    @State private var selectedDeck: CustomUserDeck?
    @State private var word = ""
    @State private var translate = ""
    @State private var isPresented: Bool = false
    var body: some View {
        NavigationStack {
            VStack {
                Text("Your decks")
                    .foregroundStyle(.black)
                    .font(.headline)
                    .padding()
                List {
                    ForEach(userDataModel.deckStore, id: \.self) {deck in
                        NavigationLink {
                            CardsListPageView(deck: deck)
                        } label: {
                            HStack {
                                Image(.flash)
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                
                                Text(deck.name ?? "")
                                    .foregroundStyle(.black)
                                    .font(.footnote)
                                Spacer()
                                Text("\(userDataModel.getCardCount(for: deck)) cards")
                                    .font(.footnote)
                                    .foregroundStyle(.black)
                            }
                        }
                    }
                    .onDelete { offsets in
                        for index in offsets {
                            let deck = userDataModel.deckStore[index]
                            userDataModel.deleteDeck(deck)
                        }
                    }
                }
                .listStyle(.plain)
                .onAppear(perform: userDataModel.fetchDecks)
                .padding(.horizontal)
            }
        }
    }
    
}
