//
//  RememberMeAppApp.swift
//  RememberMeApp
//
//  Created by Daniil on 02/12/2024.
//

import SwiftUI
import CoreData

@main
struct RememberMeAppApp: App {
    @StateObject private var userDataModel = UserDataModel(context: CoreDataController.shared.presistenceContainer.viewContext)
    var body: some Scene {
        WindowGroup {
            HomePageView()
                .environmentObject(userDataModel)
                .preferredColorScheme(.light)
        }
    }
}
