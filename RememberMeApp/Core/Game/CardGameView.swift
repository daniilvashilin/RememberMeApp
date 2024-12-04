//
//  CardGameView.swift
//  RememberMeApp
//
//  Created by Daniil on 04/12/2024.
//

import SwiftUI

struct CardGameView: View {
    @State var currentCard = 0
    @EnvironmentObject private var userDataModel: UserDataModel
    var body: some View {
        VStack {
            HStack {
                // Timer
                TimerView()
                Spacer()
                Text("\(currentCard) / 50")
                Spacer()
                Button {
                    // End game
                } label: {
                    Text("End")
                        .padding()
                        .foregroundStyle(.white)
                        .background(.red)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                }
            }
            Spacer()
            RoundedRectangle(cornerRadius: 25)
                .fill(.indigo)
                .frame(width: 250, height: 350)
                .padding()
            
            HStack(spacing: 60) {
                Button {
                    //
                } label: {
                    Image(systemName: "arrow.left")
                        .font(.largeTitle.bold())
                        .foregroundStyle(.blue)
                }

                Button {
                    //
                } label: {
                    Image(systemName: "arrow.right")
                        .font(.largeTitle.bold())
                        .foregroundStyle(.blue)
                }
            }
            .padding()
            Spacer()
        }
        .padding()
    }
}

struct CustimPreview_CardGame: PreviewProvider {
    static var previews: some View {
        CardGameView()
    }
}
