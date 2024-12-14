////
////  CradCustimizeView.swift
////  RememberMeApp
////
////  Created by Daniil on 08/12/2024.
////
//
//import SwiftUI
//
//struct CradCustimizeView: View {
//    @State var theWord: String
//    @State var theTranslate: String
//    @State private var cardMode = false
//    var body: some View {
//            Button {
//                cardMode.toggle()
//            } label: {
//                ZStack {
//                    RoundedRectangle(cornerRadius: 25)
//                        .fill(.blue)
//                        .frame(height: 350)
//                    Text(cardMode ? theTranslate : theWord)
//                        .foregroundStyle(.white)
//                        .font(.largeTitle.bold())
//                }
//                .padding(.horizontal, 80)
//            }
//    }
//}
//
//#Preview {
//    CradCustimizeView(theWord: "word", theTranslate: "translate")
//}
