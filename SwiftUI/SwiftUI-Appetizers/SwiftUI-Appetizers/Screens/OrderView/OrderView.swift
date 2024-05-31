//
//  OrderView.swift
//  SwiftUI-Appetizers
//
//  Created by Gerard on 5/25/24.
//

import SwiftUI

struct OrderView: View {
    
//    @StateObject var viewModel = OrderViewModel()
    @EnvironmentObject var orders : Order
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(orders.items) { data in
                            AppetizerListCell(data: data)
                                .listRowSeparator(.hidden)
                        }
                        .onDelete(perform: orders.deleteItems(_:))
                    }
                    .listStyle(PlainListStyle())
                    
                    Button {
                        
                    } label: {
                        APButton(title: "$\(orders.totalPrice) - Place Order")
                            .padding()
                    }
                }
                
                if orders.items.isEmpty {
                    EmptyState(imageName: "empty-order", message: "You have no items in your order")
                }
            }
            .navigationTitle("Orders")
        }
    }
    
    
}

#Preview {
    OrderView()
}
