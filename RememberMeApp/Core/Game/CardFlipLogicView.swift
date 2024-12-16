import SwiftUI

struct CardFlipLogicView: View {
    @EnvironmentObject private var userDataModel: UserDataModel
    @State private var cards: [Cards] = []
    @Binding var currentCount: Int
    private func refreshCards() {
        cards = userDataModel.fetchCards(for: deck)
    }
    var deck: CustomUserDeck
    var body: some View {
        GeometryReader { geometry in
            TabView(selection: $currentCount) {
                ForEach(Array(cards.enumerated()), id: \.1) { index, card in
                    CradCustimizeView(theWord: card.word ?? "W", theTranslate: card.translate ?? "T")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding()
                        .tag(index) // Привязываем индекс карты как тег
                }
            }
            .tabViewStyle(PageTabViewStyle()) // Переключение по страницам
            .indexViewStyle(.page(backgroundDisplayMode: .never)) // Указатель страниц
        }
        .onAppear(perform: refreshCards)
    }
    
}
