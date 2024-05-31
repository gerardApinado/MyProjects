//
//  OrderView.swift
//  SwiftUI-Appetizers
//
//  Created by Gerard on 5/25/24.
//

import SwiftUI

struct OrderView: View {
    
    @StateObject var viewModel = OrderViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(viewModel.orders) { data in
                            AppetizerListCell(data: data)
                                .listRowSeparator(.hidden)
                        }
                        .onDelete(perform: deleteItems(_:))
                    }
                    .listStyle(PlainListStyle())
                    
                    Button {
                        
                    } label: {
                        APButton(title: "$30.97 - Place Order")
                            .padding()
                    }
                }
            }
            .navigationTitle("Orders")
        }
    }
    
    func deleteItems(_ atOffesets: IndexSet) {
        viewModel.orders.remove(atOffsets: atOffesets)
    }
}

#Preview {
    OrderView()
}
