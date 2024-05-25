//
//  ContentView.swift
//  SwiftUI-Appetizers
//
//  Created by Gerard on 5/25/24.
//

import SwiftUI

struct AppetizerTabView: View {
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem {
                    Text("Home")
                    Image(systemName: "house")
                }
            
            OrderView()
                .tabItem {
                    Text("Order")
                    Image(systemName: "bag")
                }
            
            AccountView()
                .tabItem {
                    Text("Account")
                    Image(systemName: "person")
                }
        }
        .accentColor(.brandPrimary)
    }
}

#Preview {
    AppetizerTabView()
}
