//
//  ConstantStrings.swift
//  UserAuthFirebase
//
//  Created by Gerard on 6/5/24.
//

import Foundation

struct ConstantStrings {
    
    struct API {
        static let baseURL = "http://localhost:3000/api/"
    }
    
    struct Path {
        static let user = "user/"
    }
    
    struct Endpoints {
        struct User {
            static let registerUser = "registerUser"
            static let verifyLogin = "verifyLogin"
            static let verifyToken = "verifyToken"
        }
    }
}
