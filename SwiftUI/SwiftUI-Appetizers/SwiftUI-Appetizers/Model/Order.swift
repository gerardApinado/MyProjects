//
//  Order.swift
//  SwiftUI-Appetizers
//
//  Created by Gerard on 5/31/24.
//

import Foundation
import SwiftUI

final class Order: ObservableObject {
    
    @Published var items: [Appetizer] = []
    
    var totalPrice: Double {
        items.reduce(0) { $0 + $1.price }
    }
    
    func add(_ appetizer: Appetizer) {
        items.append(appetizer)
    }
    
    func deleteItems(_ atOffesets: IndexSet) {
        items.remove(atOffsets: atOffesets)
    }
}
