//
//  Alert.swift
//  SwiftUI-Appetizers
//
//  Created by Gerard on 5/26/24.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidData      = AlertItem(title: "Server Error",
                                            message: "The data recieved from the server was invalid. Please contact support",
                                            dismissButton: .default(Text("Ok")))
    static let invalidURL       = AlertItem(title: "Server Error", 
                                            message: "Invalid response from the server. Please try again later",
                                            dismissButton: .default(Text("Ok")))
    static let invalidResponse  = AlertItem(title: "Server Error", 
                                            message: "There was an issue connection to the server",
                                            dismissButton: .default(Text("Ok")))
    static let unableToComplete = AlertItem(title: "Server Error", 
                                            message: "Unable to complete your request at this time. Please check your internet connection.",
                                            dismissButton: .default(Text("Ok")))
}
