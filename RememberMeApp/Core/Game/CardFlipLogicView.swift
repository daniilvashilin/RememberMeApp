//import SwiftUI
//
//struct CardFlipLogicView: View {
//    @EnvironmentObject private var userDataModel: UserDataModel
//    @State private var cards: [Cards] = []
//    private func refreshCards() {
//        cards = userDataModel.fetchCards(for: deck)
//    }
//    var deck: CustomUserDeck
//    var body: some View {
//        VStack {
//            ForEach(cards, id: \.self) {card in
//                CradCustimizeView(theWord: card.word ?? "word", theTranslate: card.translate ?? "translate")
//            }
//        }
//        .onAppear(perform: refreshCards)
//    }
//}
//
