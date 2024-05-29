//
//  AppetizerListView.swift
//  SwiftUI-Appetizers
//
//  Created by Gerard on 5/25/24.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject private var viewModel = AppetizerListViewModel()
    
    
    var body: some View {
        NavigationView {
            ZStack {
                List(viewModel.appetizers) { appetizer in
                    AppetizerListCell(data: appetizer)
                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            viewModel.selectedAppetizer = appetizer
                            viewModel.isShowingDetailView = true
                        }
                }
                .listStyle(PlainListStyle())
                .navigationTitle("🍽️ Appetizers")
                .blur(radius: viewModel.isShowingDetailView ? 10 : 0)
                .disabled(viewModel.isShowingDetailView)
                
                if let selected = viewModel.selectedAppetizer,
                   viewModel.isShowingDetailView {
                    AppetizerDetailView(appetizerDetail: selected,
                                        isShowingDetailView: $viewModel.isShowingDetailView)
                }
                
                if viewModel.isLoading {
                    LoadingView()
                }
            }
            
        }
        .onAppear {
            viewModel.getAppetizers()
        }
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


