//
//  AppetizerAccountView.swift
//  Appetizers
//
//  Created by sanwar on 30/07/24.
//

import SwiftUI

struct AppetizerAccountView: View {
    
@StateObject var viewModel=AccountViewModel()
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Personal Info")) {
                    TextField("First Name", text: $viewModel.user.firstName)
                    TextField("Last Name", text: $viewModel.user.lastName)
                    TextField("Email", text: $viewModel.user.email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        
                    DatePicker("Birthdate", selection: $viewModel.user.date,displayedComponents: .date)
                    Button("Save Changes"){
                        print("Account Button")
                        viewModel.saveChanges()
                    }


                }
                Section(header: Text("Request")) {
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                    Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefills)
                }
                
            }
            .navigationTitle("Account")
            .alert(isPresented: $viewModel.alertState) {
                viewModel.alertItem
            }
            .onAppear{
                viewModel.fetchUserData()
            }

            
        }
        


        
    }
}

struct AppetizerAccountView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerAccountView()
    }
}
