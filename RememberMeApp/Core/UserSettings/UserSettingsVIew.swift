//
//  UserSettingsVIew.swift
//  RememberMeApp
//
//  Created by Daniil on 04/12/2024.
//

import SwiftUI
import MessageUI

struct UserSettingsVIew: View {
    @EnvironmentObject private var userDataModel: UserDataModel
    @State private var isPressed = false
    @State private var alertIspressed = false
    var body: some View {
        VStack {
            List {
                Button {
                    //                    userDataModel.clearDecks()
                    alertIspressed = true
                    
                } label: {
                    HStack {
                    Text("Delete all data")
                        Image(systemName: "folder.fill.badge.minus")
                    }
                    .getCustomSettingsButtonForList()
                }
                Button {
                    if MFMailComposeViewController.canSendMail() {
                        isPressed = true
                    } else {
                        print("Mail services are not available")
                    }
                } label: {
                    HStack {
                    Text("Support ticket")
                        Image(systemName: "questionmark.circle.fill")
                    }
                    .getCustomSettingsButtonForList()
                }
                Button {
                    // Rate AppStore
                } label: {
                    HStack {
                        Text("Rate us on AppStore")
                        Image(systemName: "star.circle")
                    }
                    .getCustomSettingsButtonForList()
                }
            }
            .padding()
            .listStyle(.plain)
            .sheet(isPresented: $isPressed) {
                MailView(
                    recipients: ["support@yourapp.com"],
                    subject: "Support Request",
                    body: "Dear Support Team, \n\n"
                )
            }
            .alert(isPresented: $alertIspressed) {
                Alert(
                    title: Text("Delete all data"),
                    message: Text("are you sure you want to delete all data."),
                    primaryButton: .default(
                        Text("Cancel"),
                        action: .some({})
                    ),
                    secondaryButton: .destructive(
                        Text("Delete"),
                        action: userDataModel.clearDecks
                    )
                )
            }
        }
    }
}
                    
                    
