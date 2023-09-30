//
//  ContactModel.swift
//  ContactsApp
//
//  Created by Назерке Кулан on 04.10.2021.
//

import Foundation

struct ContactModel: Identifiable, Codable {
    let id: String
    let name: String
    let number: String
    var isGirl: Bool
    
    init(id: String = UUID().uuidString, name: String, number: String, isGirl: Bool) {
        self.id = id
        self.name = name
        self.number = number
        self.isGirl = isGirl
    }
    
    func updateCompletion(newName: String, newNumber: String, newBool: Bool) -> ContactModel {
        return ContactModel(id: id, name: newName, number: newNumber, isGirl: newBool)
    }
    
}
