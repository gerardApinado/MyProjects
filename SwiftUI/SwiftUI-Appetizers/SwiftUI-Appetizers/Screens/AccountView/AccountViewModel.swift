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
    
}
