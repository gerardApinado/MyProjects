//
//  AuthenticationViewModel.swift
//  UserAuthFirebase
//
//  Created by Gerard on 6/5/24.
//

import SwiftUI

final class AuthenticationViewModel: ObservableObject {
    
    @Published var selectedAuthMethod: AuthMethod? {
        didSet { isShowingLoginView = true }
    }
    @Published var isShowingLoginView: Bool = false
    
}
