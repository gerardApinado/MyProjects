//
//  Appetizer.swift
//  SwiftUI-Appetizers
//
//  Created by Gerard on 5/25/24.
//

import Foundation

struct Appetizer : Codable, Identifiable {
    let id : Int
    let name : String
    let description : String
    let price : Double
    let protein : Int
    let carbs : Int
    let imageURL : String
}

struct AppetizerResponse {
    let request : [Appetizer]
}

struct MockData {
    static let sampleAppetizer = Appetizer(id: 01, name: "Steak", description: "Yum burger", price: 9.99, protein: 99, carbs: 99, imageURL: "")
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
}
