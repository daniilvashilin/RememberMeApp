//
//  MainPageView.swift
//  RememberMeApp
//
//  Created by Daniil on 03/12/2024.
//

import SwiftUI

struct UnderHeaderContentView: View {
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.black)
                        .frame(width: 155, height: 155)
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.white)
                        .frame(width: 150, height: 150)
                    VStack {
                        Text("Day strike")
                            .foregroundStyle(.black)
                            .font(.title2.bold())
                        HStack {
                            Text("1")
                                .font(.largeTitle.bold())
                                .foregroundStyle(.black)
                            Image(.fire)
                                .resizable()
                                .frame(width: 40, height: 40)
                        }
                    }
                }
                .padding()
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.black)
                        .frame(width: 155, height: 155)
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.white)
                        .frame(width: 150, height: 150)
                    VStack {
                        Text("TOP DECKS")
                            .font(.headline)
                        Image(.top)
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                }
                .padding()
            }
        }
    }
}

struct CustomMainPage: PreviewProvider {
    static var previews: some View {
        UnderHeaderContentView()
    }
}
