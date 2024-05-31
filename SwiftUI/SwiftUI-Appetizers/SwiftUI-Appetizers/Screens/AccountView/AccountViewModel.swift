//
//  AccountViewModel.swift
//  SwiftUI-Appetizers
//
//  Created by Gerard on 5/31/24.
//

import Foundation
import SwiftUI

final class AccountViewModel: ObservableObject {
    
    @AppStorage("user") private var userData: Data? ///UserDefaults
    
    @Published var user : User = User()
    @Published var alertItem : AlertItem?
    
    func saveChanges() {
        guard isValidForm else { return }
        
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.FormAlert.saveChangeSuccess
        } catch {
            alertItem = AlertContext.FormAlert.invalidUserData
        }
    }
    
    func retriveUser() {
        guard let userData = userData else { return }
        
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            alertItem = AlertContext.FormAlert.invalidUserData
        }
    }
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem = AlertContext.FormAlert.invalidForm
            return false
        }
        
        guard user.email.isValidEmail else {
            alertItem = AlertContext.FormAlert.invalidEmail
            return false
        }
        
        return true
    }
    
    
}
