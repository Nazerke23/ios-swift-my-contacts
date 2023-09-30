//
//  NoContactsView.swift
//  ContactsApp
//
//  Created by Назерке Кулан on 04.10.2021.
//


import SwiftUI

struct NoContactsView: View {
    
    @State var animate: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Text("Do you friends? Or family? You need to save contacts of your people to call")
                    .padding(.bottom, 20)
                
                NavigationLink(
                    destination: AddContactView(),
                    label: {
                        Text("Add Contact 🥺")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(animate ? Color.gray : Color.pink)
                            .cornerRadius(10)
                    })
                    .padding(.horizontal, animate ? 30 : 50)
                    .shadow(
                        color: animate ? Color.pink : Color.gray,
                        radius: animate ? 30 : 10,
                        x: 0,
                        y: animate ? 50 : 30)
                    .scaleEffect(animate ? 1.1 : 1.0)
                    .offset(y: animate ? -7 : 0)
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
    
}

struct NoContactsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoContactsView()
                .navigationTitle("    😲😲😲😲😲😲😲😲😲")
        }
    }
}


