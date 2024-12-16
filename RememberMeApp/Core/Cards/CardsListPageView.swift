import SwiftUI

struct CardsListPageView: View {
    @EnvironmentObject var userDataModel: UserDataModel
    var deck: CustomUserDeck
    
    // Состояния
    @State private var addButtonPressed = false
    @State private var enterWord = ""
    @State private var enterTranslation = ""
    @State private var cards: [Cards] = []
    @State private var startGame = false
    @State private var isEditing = false
    @State private var selectedCard: Cards? = nil
    @State private var notEnughCardsToStartGame = false
    
    var body: some View {
        VStack {
            List {
                ForEach(cards, id: \.self) { card in
                    cardRow(for: card)
                        .onLongPressGesture {
                            selectCardForEditing(card)
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
            .scrollIndicators(.hidden)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    addButton
                    startGameButton
                }
            }
            .sheet(isPresented: $addButtonPressed) {
                addCardSheet
            }
            .sheet(item: $selectedCard) { card in
                editCardSheet(for: card)
            }
            .sheet(isPresented: $startGame) {
                MainGamePageView(deck: deck)
            }
        }
        .onAppear(perform: refreshCards)
        .alert(isPresented: $notEnughCardsToStartGame) {
            Alert(
                title: Text("Add more cards"),
                message: Text("You need less one card " +
                              "to start.")
            )
        }
    }
    
    // MARK: methods
    private func refreshCards() {
        cards = userDataModel.fetchCards(for: deck)
    }
    
    private func shouldGameStart() {
        if cards.count < 1 {
            notEnughCardsToStartGame = false
        } else {
            notEnughCardsToStartGame = true
        }
    }
    
    private func selectCardForEditing(_ card: Cards) {
        selectedCard = card
        enterWord = card.word ?? ""
        enterTranslation = card.translate ?? ""
        isEditing = true
    }
    
    // MARK: - Subviews
    private func cardRow(for card: Cards) -> some View {
        HStack {
            Image(.aCard)
                .resizable()
                .frame(width: 40, height: 40)
            VStack(alignment: .leading) {
                Text("Word: \(card.word ?? "x")")
                    .font(.footnote.bold())
                Text("Translation: \(card.translate ?? "x")")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
    
    private var addButton: some View {
        Button(action: { addButtonPressed = true }) {
            Image(systemName: "plus.circle.fill")
                .font(.headline)
                .foregroundStyle(.blue)
        }
    }
    
    private var startGameButton: some View {
        Button {
            if cards.count >= 1 {
                notEnughCardsToStartGame = false
                startGame = true
            } else {
                notEnughCardsToStartGame = true
                startGame = false 
            }
        } label: {
            Image(systemName: "play.circle.fill")
                .font(.headline)
                .foregroundStyle(.purple)
        }
    }
    
    
    private var addCardSheet: some View {
        VStack {
            Text("Add card")
                .font(.headline)
            TextField("Word", text: $enterWord)
                .padding()
                .textFieldStyle(.roundedBorder)
            TextField("Translate", text: $enterTranslation)
                .padding()
                .textFieldStyle(.roundedBorder)
            Button("Add Card") {
                userDataModel.addCard(to: deck, word: enterWord, translation: enterTranslation)
                addButtonPressed = false
                refreshCards()
                clearInputFields()
            }
            .getCustomButtonStyle(bakcGroundColor: enterWord.isEmpty || enterTranslation.isEmpty ? .secondary : .green)
            .disabled(enterWord.isEmpty || enterTranslation.isEmpty)
            .padding()
        }
        .padding()
    }
    
    private func editCardSheet(for card: Cards) -> some View {
        VStack {
            Text("Edit card")
                .font(.headline)
            TextField("Word", text: $enterWord)
                .padding()
                .textFieldStyle(.roundedBorder)
            TextField("Translate", text: $enterTranslation)
                .padding()
                .textFieldStyle(.roundedBorder)
            Button("Save Changes") {
                userDataModel.editCard(card, newWord: enterWord, newTranslation: enterTranslation)
                selectedCard = nil
                refreshCards()
                clearInputFields()
            }
            .getCustomButtonStyle(bakcGroundColor: enterWord.isEmpty || enterTranslation.isEmpty ? .secondary : .green)
            .disabled(enterWord.isEmpty || enterTranslation.isEmpty)
            .padding()
        }
        .padding()
    }
    
    private func clearInputFields() {
        enterWord = ""
        enterTranslation = ""
    }
}
