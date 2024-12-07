//
//  GameResualtView.swift
//  RememberMeApp
//
//  Created by Daniil on 07/12/2024.
//

import SwiftUI

struct GameResultView: View {
    var formatedTime: String
    var currentNumberOfCards: Int
    var cardingValue: Int
    var onClose: () -> Void
    @State var flipAngel: Double = 0
    @State private var scale = 0.5
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(.black)
                    .frame(width: 300, height: 120)
                HStack {
                    Image(systemName: "clock.badge.checkmark.fill")
                        .font(.headline)
                        .foregroundColor(.white)
                    Text(formatedTime)
                        .font(.headline)
                        .foregroundColor(.white)
                    Image(systemName: "archivebox.fill")
                        .font(.headline)
                        .foregroundColor(.white)
                    Text("\(currentNumberOfCards)/\(cardingValue)")
                        .font(.headline)
                        .foregroundColor(.white)
                }
            }
            .padding()
            .rotation3DEffect(.degrees(flipAngel), axis: (x: 1, y: 0, z: 0))
                .onAppear {
                    withAnimation(.spring(response: 0.6, dampingFraction: 0.5)) {
                        flipAngel = (flipAngel == 0) ? 360 : 0 
                    }
                }
            
            Button(action: onClose) {
                Text("End game")
                    .padding()
                    .background(.purple)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .scaleEffect(scale)
                                .onAppear {
                                    withAnimation(.spring(response: 0.4, dampingFraction: 0.3, blendDuration: 0)) {
                                        scale = 1.0
                                    }
                                }
            }
        }
    }
}
