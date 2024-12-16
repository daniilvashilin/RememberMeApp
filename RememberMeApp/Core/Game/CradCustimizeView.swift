//
//  CradCustimizeView.swift
//  RememberMeApp
//
//  Created by Daniil on 08/12/2024.
//

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
