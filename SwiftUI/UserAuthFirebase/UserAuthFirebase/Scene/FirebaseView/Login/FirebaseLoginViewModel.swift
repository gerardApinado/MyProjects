//
//  FirebaseLoginViewModel.swift
//  UserAuthFirebase
//
//  Created by Gerard on 6/6/24.
//

import Foundation
import SwiftUI
import Firebase

final class FirebaseLoginViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {
        
    }
    
    func signIn(withEmail: String, password: String) async throws {
        
    }
    
    func createUser(withEmail: String, password: String, fullName: String) async throws {
        
    }
    
    func signOut() {
        
    }
    
    func deleteAccount() {
        
    }
    
    func fetchUser() async {
        
    }
    
}
