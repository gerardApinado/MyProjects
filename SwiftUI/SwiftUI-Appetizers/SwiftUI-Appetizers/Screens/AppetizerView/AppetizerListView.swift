//
//  AppetizerListView.swift
//  SwiftUI-Appetizers
//
//  Created by Gerard on 5/25/24.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject private var viewModel = AppetizerListViewModel()
    @State private var isShowingDetailView: Bool = false
    @State private var selectedAppetizer: Appetizer?
    
    var body: some View {
//        ZStack {
            NavigationView {
                ZStack {
                    List(viewModel.appetizers ?? MockData.appetizers) { appetizer in
                        AppetizerListCell(data: appetizer)
                            .listRowSeparator(.hidden)
                            .onTapGesture {
                                selectedAppetizer = appetizer
                                isShowingDetailView = true
                            }
                    }
                    .listStyle(PlainListStyle())
                    .navigationTitle("🍽️ Appetizers")
                    .blur(radius: isShowingDetailView ? 10 : 0)
                    .scrollDisabled(isShowingDetailView)
                    
                    if let selected = selectedAppetizer,
                       isShowingDetailView {
                        AppetizerDetailView(appetizerDetail: selected,
                                            isShowingDetailView: $isShowingDetailView)
                    }
                    
                    if viewModel.isLoading {
                        LoadingView()
                    }
                }
                
            }
            .onAppear {
                viewModel.getAppetizers()
            }
        
            
//            .sheet(isPresented: $viewModel.isShowingDetailView, content: {
//                if let selected = viewModel.selectedAppetizer {
//                    AppetizerDetailView(appetizerDetail: selected, isShowingDetailView: $viewModel.isShowingDetailView)
//                }
//            })
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


