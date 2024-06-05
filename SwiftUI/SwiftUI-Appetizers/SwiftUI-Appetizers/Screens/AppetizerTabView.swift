//
//  ContentView.swift
//  SwiftUI-Appetizers
//
//  Created by Gerard on 5/25/24.
//

import SwiftUI

struct AppetizerTabView: View {
    
    @EnvironmentObject var orders : Order
    
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem {
//                    Text("Home")
//                    Image(systemName: "house")
                    Label("Home", systemImage: "house")
                }
            
            OrderView()
                .tabItem {
//                    Text("Order")
//                    Image(systemName: "bag")
                    Label("Order", systemImage: "bag")
                }
                .badge(orders.items.count)
            
            AccountView()
                .tabItem {
//                    Text("Account")
//                    Image(systemName: "person")
                    Label("Account", systemImage: "person")
                }
        }
        .accentColor(.brandPrimary)
    }
}

#Preview {
    AppetizerTabView()
}
