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
        HeaderView()
            .border(.red)
        VStack {
            if selectedtabMain == 1 {
                Text("Home page")
                    .border(.green)
            } else if selectedtabMain == 2 {
                DecksPageView()
            } else {
                Text("User settings")
                    .border(.green)
            }
            Spacer()
            CustomTabView(selectedTab: $selectedtabMain)
                .border(.orange)
        }
    }
}


