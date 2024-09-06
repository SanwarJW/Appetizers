//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by sanwar on 19/08/24.
//

import Foundation
import SwiftUI

class AccountViewModel:ObservableObject{
    
    @Published var user=User()
    @AppStorage("user") private var userData:Data?
    @Published var alertState=false

     var alertItem=AlertContext.invalidForm
    
    func saveChanges(){
        guard isValidForm else{return alertState=true}
        do{
            userData=try JSONEncoder().encode(user)
            
            alertItem=AlertContext.userSaveSuccess
            return alertState=true
        }catch{
            alertItem=AlertContext.invalidUserData
            return alertState=true
        }
    }
    
    func fetchUserData(){
        guard let data = userData else{return}
        do{
            user = try JSONDecoder().decode(User.self, from: data)

        }catch{
            alertItem=AlertContext.invalidUserData
            return alertState=true
        }
    }

    
    var isValidForm:Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem=AlertContext.invalidForm
            return false
        }
        guard user.email.isValidEmail else{
            alertItem=AlertContext.invalidEmail
            return false
        }
        return true
    }
        
}
