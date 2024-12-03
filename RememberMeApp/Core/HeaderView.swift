//
//  HeaderView.swift
//  RememberMeApp
//
//  Created by Daniil on 03/12/2024.
//

import SwiftUI
struct HeaderView: View {
    @EnvironmentObject var userDataModel: UserDataModel
    @State private var isPresented: Bool = false
    @State var deckNewName = ""
    var body: some View {
            HStack {
                Text("RememberMe")
                    .foregroundStyle(.white)
                    .font(.headline)
                Spacer()
                
                Button {
                    isPresented = true
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .foregroundStyle(.green)
                        .font(.headline)
                }
            }
            .padding()
            .background(.indigo)
            .sheet(isPresented: $isPresented) {
                TextField("Deck name", text: $deckNewName)
                Button {
                    userDataModel.addDeck(name: deckNewName)
                } label: {
                    Text("Add deck")
                        .foregroundStyle(.white)
                        .font(.footnote)
                        .frame(width: 200, height: 70)
                        .background(.green)
                }

            }
    }
}

