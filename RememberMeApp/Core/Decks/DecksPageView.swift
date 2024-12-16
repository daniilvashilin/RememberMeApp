//
//  DecksPageView.swift
//  RememberMeApp
//
//  Created by Daniil on 03/12/2024.
//

import SwiftUI

struct DecksPageView: View {
    @EnvironmentObject var userDataModel: UserDataModel
    @State private var selectedDeck: CustomUserDeck? = nil
    @State private var word = ""
    @State private var translate = ""
    @State private var isPresented: Bool = false
    @State private var showDeleteAlert = false
    @State private var editDeck = false
    @State private var newDeckName: String = "'"
    var body: some View {
        NavigationStack {
            if userDataModel.deckStore.isEmpty {
                Text("No decks yet")
                    .foregroundStyle(.secondary)
                    .font(.headline)
                    .onAppear(perform: userDataModel.fetchDecks)
            } else {
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
                                .onLongPressGesture {
                                    editDeck = true
                                    selectedDeck = deck
                                    newDeckName = deck.name ?? ""
                                }
                            }
                            .swipeActions {
                                       Button(role: .destructive) {
                                           selectedDeck = deck
                                           showDeleteAlert = true
                                       } label: {
                                           Label("Delete", systemImage: "trash")
                                       }
                                   }
                        }
                    }
                    .listStyle(.plain)
                    .onAppear(perform: userDataModel.fetchDecks)
                    .padding(.horizontal)
                    .scrollIndicators(.hidden)
                }
            }
        }
        .sheet(isPresented: $editDeck) {
            VStack {
                Text("Edit deck")
                TextField("new", text: $newDeckName)
                    .padding()
                    .textFieldStyle(.roundedBorder)
                Button {
                    if let selectedDeck = selectedDeck {
                        userDataModel.editDeck(selectedDeck, newName: newDeckName)
                        editDeck = false
                    }
                } label: {
                    Text("Save changes")
                        .getCustomButtonStyle(bakcGroundColor: newDeckName.isEmpty ? .secondary : .green)
                }
                .padding()
                .disabled(newDeckName.isEmpty)
            }
        }
        .alert(isPresented: $showDeleteAlert) {
            Alert(
                title: Text("Delete Deck?"),
                message: Text("Are you sure you want to delete \(selectedDeck?.name ?? "this deck")?"),
                primaryButton: .default(
                    Text("Cancel"),
                    action: {
                        selectedDeck = nil // Просто скрываем алерт
                    }
                ),
                secondaryButton: .destructive(
                    Text("Delete"),
                    action: {
                        if let deck = selectedDeck {
                            userDataModel.deleteDeck(deck) // Удаляем колоду
                            selectedDeck = nil // Очищаем выбранную колоду
                        }
                    }
                )
            )
        }
    }
}
