//
//  OneContactView.swift
//  ContactsApp
//
//  Created by Назерке Кулан on 04.10.2021.
//

import SwiftUI
struct OneContactView: View {
    
    let contact : ContactModel
    
    var body: some View {
        HStack{
            if contact.isGirl{
                Image("girl")
                    .resizable()
                    .scaledToFit()
                    .frame(width:60, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }else{
                Image("boy")
                    .resizable()
                    .scaledToFit()
                    .frame(width:60, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            
            VStack(spacing: 5) {
                Text(contact.name)
                    .fontWeight(.bold)
                Text(contact.number)
            }
            Spacer()
        }
    }
}

struct OneContactView_Previews: PreviewProvider {
    static var previews: some View {
        OneContactView(contact: ContactModel(name: "Nazerke Kulan", number: "+77002390794", isGirl: true))
    }
}

