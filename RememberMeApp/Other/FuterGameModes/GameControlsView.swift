//
//  GameControllersView.swift
//  RememberMeApp
//
//  Created by Daniil on 07/12/2024.
//

import SwiftUI

struct GameControlsView: View {
    @Binding var isGameStarted: Bool
    @Binding var showAlert: Bool

    var body: some View {
        HStack {
            Button {
                showAlert = true
                isGameStarted = false 
            } label: {
                Image(systemName: "xmark.rectangle.fill")
                    .foregroundStyle(.red)
                    .font(.title)
            }

            Button {
                isGameStarted.toggle()
            } label: {
                Image(systemName: isGameStarted ? "pause.rectangle.fill" : "play.rectangle.fill")
                    .font(.title)
                    .foregroundStyle(isGameStarted ? .blue : .green)
            }
        }
    }
}

