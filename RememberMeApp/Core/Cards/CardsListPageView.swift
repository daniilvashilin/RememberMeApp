import SwiftUI

struct CardsListPageView: View {
    @EnvironmentObject var userDataModel: UserDataModel
    var deck: CustomUserDeck
    @State private var addButtonPressed = false
    @State private var enterWord = ""
    @State private var enterTranslation = ""
    @State private var cards: [Cards] = []
    @State private var startGmae = false
    var body: some View {
        VStack {
            List {
                ForEach(cards, id: \.self) { card in
                    HStack {
                        Image(.aCard)
                            .resizable()
                            .frame(width: 40, height: 40)
                        VStack(alignment: .leading) {
                            Text("Word: \(card.word ?? "x")")
                                .font(.headline)
                            Text("Translation: \(card.translate ?? "x")")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .onDelete { offsets in
                    for index in offsets {
                        let cardToDelete = cards[index]
                        userDataModel.deleteCard(cardToDelete)
                    }
                    refreshCards()
                }
            }
            .listStyle(.plain)
            .navigationTitle(deck.name ?? "Deck")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        addButtonPressed = true
                    }) {
                        Image(systemName: "plus.diamond.fill")
                            .font(.headline)
                            .foregroundStyle(.blue)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        startGmae = true
                    }) {
                        Image(systemName: "gamecontroller.circle.fill")
                            .font(.title)
                            .foregroundStyle(.purple)
                    }
                }
            }
            .sheet(isPresented: $addButtonPressed) {
                VStack {
                    Text("Add card")
                    TextField("Word", text: $enterWord)
                        .padding()
                        .textFieldStyle(.roundedBorder)
                    TextField("Translate", text: $enterTranslation)
                        .padding()
                        .textFieldStyle(.roundedBorder)
                    Button {
                        userDataModel.addCard(to: deck, word: enterWord, translation: enterTranslation)
                        addButtonPressed = false
                        refreshCards()
                        enterWord = ""
                        enterTranslation = ""
                    } label: {
                        Text("Add Card")
                            .getCustomButtonStyle()
                            .padding()
                    }
                }
            }
        }
        .onAppear {
            refreshCards()
        }
        .sheet(isPresented: $startGmae) {
            CardGameView()
        }
    }
    private func refreshCards() {
        // Приватный метод для обновления списка карт
        cards = userDataModel.fetchCards(for: deck)
    }
}
