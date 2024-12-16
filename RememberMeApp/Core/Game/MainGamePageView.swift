//
//  MainGamePageView.swift
//  RememberMeApp
//
//  Created by Daniil on 08/12/2024.
//

import SwiftUI

struct MainGamePageView: View {
     var deck: CustomUserDeck
    @EnvironmentObject private var userDataModel: UserDataModel
    @State private var currentCount = 0
    var body: some View {
        VStack {
            CardFlipLogicView(currentCount: $currentCount, deck: deck)
            Button {
                
            } label: {
                Text("\(currentCount)/\(userDataModel.getCardCount(for: deck))")
                    .font(.title)
                    .foregroundStyle(.black)
                    .padding()
            }

        }
    }
}
