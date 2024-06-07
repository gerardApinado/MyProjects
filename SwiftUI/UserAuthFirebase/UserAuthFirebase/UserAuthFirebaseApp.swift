//
//  UserAuthFirebaseApp.swift
//  UserAuthFirebase
//
//  Created by Gerard on 6/5/24.
//

import SwiftUI
import Firebase

@main
struct UserAuthFirebaseApp: App {
    
    @StateObject var viewModel = FirebaseLoginViewModel()
    
    init () {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            AuthenticationView().environmentObject(viewModel)
        }
    }
}
