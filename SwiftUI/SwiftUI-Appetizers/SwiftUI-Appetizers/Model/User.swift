//
//  User.swift
//  SwiftUI-Appetizers
//
//  Created by Gerard on 5/31/24.
//

import Foundation

struct User: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthdate = Date()
    var extraNapkins = false
    var frequentRefill = false
}
