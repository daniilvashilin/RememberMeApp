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
    @State var headerPageText: String
    var body: some View {
        HStack {
            Text(headerPageText)
                .foregroundStyle(.white)
                .font(.title)
            Spacer()
            
            Button {
                isPresented = true
            } label: {
                ZStack {
                    Image(systemName: "circle.fill")
                        .foregroundStyle(.white)
                        .font(.title)
                    Image(systemName: "plus.circle.fill")
                        .foregroundStyle(.green)
                        .font(.title)
                }
                
            }
        }
        .padding()
        .background(.indigo)
        .sheet(isPresented: $isPresented) {
            Text("Add deck")
            TextField("Deck name", text: $deckNewName)
                .padding()
                .textFieldStyle(.roundedBorder)
            Button {
                userDataModel.addDeck(name: deckNewName)
                isPresented = false
                deckNewName = ""
            } label: {
                Text("Add deck")
                    .getCustomButtonStyle(bakcGroundColor: deckNewName.isEmpty ? .secondary : .green)
                    .padding()
            }
            .disabled(deckNewName.isEmpty)
        }
    }
}

