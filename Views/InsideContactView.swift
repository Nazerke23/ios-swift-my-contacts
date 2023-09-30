//
//  InsideContactView.swift
//  ContactsApp
//
//  Created by Назерке Кулан on 04.10.2021.
//

import SwiftUI

struct InsideContactView: View {
    
    let contact : ContactModel
    
    @EnvironmentObject var contactViewModel: ContactViewModel
    @Environment(\.presentationMode) var presentationMode
    @State var textFieldName: String = ""
    @State var textFieldNumber: String = ""
    @State var selection: String = "Girl"
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        VStack{
            if contact.isGirl{
                         Image("girl")
                             .resizable()
                             .scaledToFit()
                             .frame(width:200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
             }else{
                 Image("boy")
                     .resizable()
                     .scaledToFit()
                     .frame(width:200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
             }
            
            TextField(contact.name, text: $textFieldName)
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
            
            
            TextField(contact.number, text: $textFieldNumber)
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
            
            Picker(
                selection: $selection,
                label:
                    Text("Choose Gender")
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.orange)
                    .cornerRadius(10),
                content: {
                Text("Girl").tag("Girl")  .foregroundColor(Color.accentColor)
                Text("Boy").tag("Boy")
                    .foregroundColor(Color.accentColor)
            })
                .pickerStyle(MenuPickerStyle())
            
            Button(action: updateButtonPressed, label: {
                Text("Update".uppercased())
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .cornerRadius(10)
            })
            
            Spacer()
        }.padding()
      
        

    }
    
    
    func updateButtonPressed(){
        var sendBool: Bool
        if selection == "Girl"{
            sendBool = true
        }else{
            sendBool = false
        }
        
        
        contactViewModel.updateContact(contact: contact, newName: textFieldName, newNumber: textFieldNumber, newBool: sendBool)
        presentationMode.wrappedValue.dismiss()
    }
}




struct InsideContactView_Previews: PreviewProvider {
    static var previews: some View {
        InsideContactView(contact: ContactModel(name: "Nazerke Kulan", number: "+77002390794", isGirl: true))
    }
}
