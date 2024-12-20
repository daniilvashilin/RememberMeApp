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
<<<<<<< HEAD

import SwiftUI

struct CradCustimizeView: View {
    @State var theWord: String
    @State var theTranslate: String
    @State private var cardMode = false
    var body: some View {
        Button {
            cardMode.toggle()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(.blue.gradient)
                    .shadow(radius: 5) // Добавляем тень для визуального улучшения
                Text(cardMode ? theTranslate : theWord)
                    .foregroundStyle(.white)
                    .font(.system(size: 24, weight: .bold)) // Адаптивный шрифт
                    .multilineTextAlignment(.center)
                    .padding() // Отступы внутри карточки
            }
            .aspectRatio(3/4, contentMode: .fit) // Поддерживаем соотношение сторон 3:4
        }
    }
}

#Preview {
    CradCustimizeView(theWord: "word", theTranslate: "translate")
}
=======
//#Preview {
//    CradCustimizeView(theWord: "word", theTranslate: "translate")
//}
>>>>>>> 3649437e2997088b4b1e6b6969a50ed25a94c564
