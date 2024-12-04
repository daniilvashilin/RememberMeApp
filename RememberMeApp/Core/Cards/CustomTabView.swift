//
//  CustomTabView.swift
//  RememberMeApp
//
//  Created by Daniil on 03/12/2024.
//

import SwiftUI

struct CustomTabView: View {
    @Binding var selectedTab: Int
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 100)
                .fill(.indigo)
                .frame(width: 200, height: 80)
            HStack {
                Button {
                    selectedTab = 1
                } label: {
                    Image(systemName: selectedTab == 1 ? "menucard.fill" : "menucard")
                        .getCustomTabStyle()
                }
                Spacer()
                Button {
                    selectedTab = 2
                } label: {
                    Image(systemName: selectedTab == 2 ? "person.circle.fill" : "person.circle")
                        .getCustomTabStyle()
                }
            }
            .frame(width: 120, height: 80)
        }
    }
}

