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
    let calories : Int
    let protein : Int
    let carbs : Int
    let imageURL : String
}

struct AppetizerResponse: Codable {
    let request : [Appetizer]
}

struct MockData {
    static let sampleAppetizer = Appetizer(id: 01,
                                           name: "Chicken Wings",
                                           description: "You'll need extra napkins with these tasty treats.",
                                           price: 9.99,
                                           calories: 700,
                                           protein: 13,
                                           carbs: 11,
                                           imageURL: "")
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
}
