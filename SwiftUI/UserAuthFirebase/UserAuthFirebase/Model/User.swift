//
//  User.swift
//  UserAuthFirebase
//
//  Created by Gerard on 6/5/24.
//

import Foundation

struct User: Identifiable, Codable {
    var id = UUID()
    let fullName: String
    let email: String
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let comp = formatter.personNameComponents(from: fullName) {
            formatter.style = .abbreviated
            return formatter.string(from: comp)
        }
            
        return ""
    }
}

extension User {
    static var MOCK_USER = User(fullName: "Michael Jordan", email: "mj@gmail.com")
}
