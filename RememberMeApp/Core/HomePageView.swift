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
        VStack {
            if selectedtabMain == 1 {
                //                MainHomePAge()
                //                    .padding()
            } else if selectedtabMain == 2 {
                DecksPageView()
            } else {
                Text("User settings")
            }
            Spacer()
            CustomTabView(selectedTab: $selectedtabMain)
        }
    }
}


