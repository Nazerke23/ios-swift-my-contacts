//
//  AddView.swift
//  TodoList
//
//  Created by Nick Sarno on 3/2/21.
//

import SwiftUI

struct AddContactView: View {
    
    // MARK: PROPERTIES
    
    //to go back mode
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var contactViewModel: ContactViewModel
    @State var textFieldName: String = ""
    @State var textFieldNumber: String = ""
    @State var selection: String = "Girl"
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    // MARK: BODY
    
    var body: some View {
        
        ScrollView {
            VStack {
                TextField("Name and Surname", text: $textFieldName)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                TextField("The phone number", text: $textFieldNumber)
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
                    
                  
                
                Button(action: saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
                
                
            }
            .padding(14)
        }
        .navigationTitle("Add your contact 😊")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    // MARK: FUNCTIONS
    
    func saveButtonPressed() {
        var isGirl: Bool
        
        if selection == "Girl"{
            isGirl = true
        }
        else {
            isGirl = false
        }
        
        
        if textIsAppropriate() {
            contactViewModel.addContact(name: textFieldName, number: textFieldNumber, isGirl: isGirl)
            //go back to mode
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldName.count == 0 || textFieldNumber.count == 0{
            alertTitle = "Type the all information about your contact!!! 😨😰😱"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
}

    // MARK: PREVIEW

struct AddContactView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                AddContactView()
            }
            .preferredColorScheme(.light)
            .environmentObject(ContactViewModel())
            NavigationView {
                AddContactView()
            }
            .preferredColorScheme(.dark)
            .environmentObject(ContactViewModel())

        }
    }
}
