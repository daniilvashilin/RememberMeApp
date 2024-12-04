//
//  HomePageView.swift
//  RememberMeApp
//
//  Created by Daniil on 03/12/2024.
//

import SwiftUI

struct HomePageView: View {
    @State private var selectedtabMain = 1
    var body: some View {
        if selectedtabMain == 1 {
            HeaderView(headerPageText: "Decks")
        } else if selectedtabMain == 2 {
            HeaderView(headerPageText: "Settings")
        }
        VStack {
            if selectedtabMain == 1 {
                DecksPageView()
            } else if selectedtabMain == 2 {
                UserSettingsVIew()
            } 
            Spacer()
            CustomTabView(selectedTab: $selectedtabMain)
        }
    }
}


