//
//  ContactListView.swift
//  ContactsApp
//
//  Created by Назерке Кулан on 04.10.2021.
//

import SwiftUI

struct ContactListView: View {
    
    @EnvironmentObject var contactViewModel : ContactViewModel
    

    
    var body: some View {
//        List{
//            ForEach(contactViewModel.contacts){ contact in
//                NavigationLink(
//                    destination: InsideContactView(contact: contact),
//                    label: {
//                        OneContactView(contact: contact)
//
//                    })
//            }
//            .onDelete(perform: contactViewModel.deleteContact)
//            .onMove(perform: contactViewModel.moveContact)
//        }
//        .listStyle(PlainListStyle())
//        .navigationTitle("My Contacts 👥")
//        .navigationBarItems(
//            leading: EditButton(),
//            trailing:
//                NavigationLink("➕", destination: AddContactView())
//            )
        
        
        
        
        
        ZStack {
            if contactViewModel.contacts.isEmpty {
                NoContactsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(contactViewModel.contacts){ contact in
                        NavigationLink(
                            destination: InsideContactView(contact: contact),
                            label: {
                                OneContactView(contact: contact)
                                
                            })
                    }
                    .onDelete(perform: contactViewModel.deleteContact)
                    .onMove(perform: contactViewModel.moveContact)
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("Contacts 👥")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("➕", destination: AddContactView())
            )
    }
}

struct ContactListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ContactListView()
        }
        .environmentObject(ContactViewModel())
    }
}


