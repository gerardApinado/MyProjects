//
//  AccountViewModel.swift
//  SwiftUI-Appetizers
//
//  Created by Gerard on 5/31/24.
//

import Foundation
import SwiftUI

final class AccountViewModel: ObservableObject {
    
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var birthdate = Date()
    
    @Published var extraNapkins = false
    @Published var frequentRefill = false
    
    @Published var alertItem : AlertItem?
    
    var isValidForm: Bool {
        guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty else {
            alertItem = AlertContext.FormAlert.invalidForm
            return false
        }
        
        guard email.isValidEmail else {
            alertItem = AlertContext.FormAlert.invalidEmail
            return false
        }
        
        alertItem = AlertContext.FormAlert.saveChangeSuccess
        return true
    }
    
    func saveChanges() {
        guard isValidForm else { return }
        
        print("Saved Changes")
    }
}
