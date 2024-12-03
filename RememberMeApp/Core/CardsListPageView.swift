import SwiftUI

struct CardsListPageView: View {
    @EnvironmentObject var userDataModel: UserDataModel
    var deck: CustomUserDeck
    @State private var addButtonPressed = false
    @State private var enterWord = ""
    @State private var enterTranslation = ""
    @State private var cards: [Cards] = []
    
    var body: some View {
        VStack {
            List {
                ForEach(userDataModel.fetchCards(for: deck), id: \.self) { card in
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
                .onDelete {offsets in
                    for index in offsets {
                        let cardToDelete = cards[index]
                        userDataModel.deleteCard(cardToDelete)
                    }
                }
                .onAppear {
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
                    } label: {
                        Text("Add Card")
                            .frame(width: 200, height: 70, alignment: .center)
                            .background(Color.green)
                            .foregroundColor(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .padding()
                    }
                }
            }
        }
    }
    
    private func refreshCards() {
        // Используем ваш метод getCards(for:) для получения карт
        cards = userDataModel.getCards(for: deck)
    }
}


