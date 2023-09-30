//
//  ContactViewModel.swift
//  ContactsApp
//
//  Created by Назерке Кулан on 04.10.2021.
//

import Foundation

class ContactViewModel: ObservableObject {
    
    @Published var contacts: [ContactModel] = []
    {
        didSet {
            saveItems()
        }
    }
    
    let itemsKey: String = "items_list"
    
    init() {
        getContacts()
    }
    
    func getContacts() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedContacts = try? JSONDecoder().decode([ContactModel].self, from: data)
        else { return }

        self.contacts = savedContacts
        
//            var contacts2: [ContactModel] = [
//                ContactModel(name: "Nazerke Kulan", number: "+77002390794", isGirl: true),
//                ContactModel(name: "Na222", number: "+77002390794", isGirl: false),
//                ContactModel(name: "Na333", number: "+77002390794", isGirl: true),
//                ]
//
//        contacts.append(contentsOf: contacts2)
    }
    
    func deleteContact(indexSet: IndexSet) {
        contacts.remove(atOffsets: indexSet)
    }
    
    func moveContact(from: IndexSet, to: Int) {
        contacts.move(fromOffsets: from, toOffset: to)
    }
    
    func addContact(name: String, number: String, isGirl: Bool) {
        let newContact = ContactModel(name: name, number: number, isGirl: isGirl)
        contacts.append(newContact)
    }
    
    func updateContact(contact: ContactModel, newName: String, newNumber: String, newBool: Bool) {
        if let index = contacts.firstIndex(where: { $0.id == contact.id }) {
            contacts[index] = contact.updateCompletion(newName: newName, newNumber: newNumber, newBool: newBool)
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(contacts) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
    
}

