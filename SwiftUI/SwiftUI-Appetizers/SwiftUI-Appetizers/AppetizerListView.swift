//
//  AppetizerListView.swift
//  SwiftUI-Appetizers
//
//  Created by Gerard on 5/25/24.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()
    
    var body: some View {
//        ZStack {
            NavigationView {
                ZStack {
                    List(viewModel.appetizers) { appetizer in
                        AppetizerListCell(data: appetizer)
                            .listRowSeparator(.hidden)
                    }
                    .listStyle(PlainListStyle())
                    .navigationTitle("🍽️ Appetizers")
                    
                    if viewModel.isLoading {
                        LoadingView()
                    }
                }
                
            }
            .onAppear {
                viewModel.getAppetizers()
            }
            
            
//        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: Text(alertItem.title),
                  message: Text(alertItem.message),
                  dismissButton: alertItem.dismissButton)
        }
    }
    
}

#Preview {
    AppetizerListView()
}


