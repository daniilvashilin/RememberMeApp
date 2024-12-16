////
////  MainGamePageView.swift
////  RememberMeApp
////
////  Created by Daniil on 08/12/2024.
////
//
//import SwiftUI
//
//struct MainGamePageView: View {
//     var deck: CustomUserDeck
//    var body: some View {
//        VStack {
////            CardFlipLogicView(deck: deck)
//            Button {
//                
//            } label: {
//                Image(systemName: "checkmark.rectangle.fill")
//                    .font(.largeTitle)
//                    .foregroundStyle(.green)
//            }
//
<<<<<<< HEAD

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
=======
//        }
//    }
//}
>>>>>>> 3649437e2997088b4b1e6b6969a50ed25a94c564
