//
//  ContactsAppApp.swift
//  ContactsApp
//
//  Created by Назерке Кулан on 04.10.2021.
//

import SwiftUI

@main
struct MyContactsApp: App {
    
    @StateObject var contactViewModel: ContactViewModel = ContactViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContactListView()
            }
            .environmentObject(contactViewModel)
        }
    }
}
