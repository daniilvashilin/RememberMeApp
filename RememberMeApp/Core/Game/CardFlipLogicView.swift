import SwiftUI

struct CardFlipLogicView: View {
    @EnvironmentObject private var userDataModel: UserDataModel
    @State private var cards: [Cards] = []
    private func refreshCards() {
        cards = userDataModel.fetchCards(for: deck)
    }
    var deck: CustomUserDeck
    var body: some View {
        VStack {
            
        }
        .onAppear(perform: refreshCards)
    }
}

