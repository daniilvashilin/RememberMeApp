import SwiftUI

struct CardsListPageView: View {
    @EnvironmentObject var userDataModel: UserDataModel
    var deck: CustomUserDeck
    @State private var addButtonPressed = false
    @State private var enterWord = ""
    @State private var enterTranslation = ""
    @State private var cards: [Cards] = []
    @State private var startGame = false
//    @State private var isGameStarted = false
//    @State private var showAlert = false
    var body: some View {
        VStack {
            // Список карточек
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
                        print("Deleting card: \(cardToDelete.word ?? "Unknown")")
                        userDataModel.deleteCard(cardToDelete)
                    }
                    refreshCards() // Обновляем массив после удаления
                }
            }
            .listStyle(.plain)
            .navigationTitle(deck.name ?? "Deck")
            .navigationBarTitleDisplayMode(.inline)

            // Toolbar с кнопками
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
                        startGame = true
                    }) {
                        Image(systemName: "gamecontroller.circle.fill")
                            .font(.title)
                            .foregroundStyle(.purple)
                    }
                }
            }

            // Модальное окно добавления карточки
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
                            .onAppear(perform: refreshCards)
                        }

            // Модальное окно игры
//            .sheet(isPresented: $startGame) {
//                MainGamePageView(deck: deck)
//            }
        }
        .onAppear(perform: refreshCards)
    }

    private func refreshCards() {
        cards = userDataModel.fetchCards(for: deck)
    }
}
