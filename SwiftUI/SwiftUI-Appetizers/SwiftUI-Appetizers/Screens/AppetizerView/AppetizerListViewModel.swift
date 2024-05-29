//
//  AppetizerListViewModel.swift
//  SwiftUI-Appetizers
//
//  Created by Gerard on 5/26/24.
//

import Foundation
import SwiftUI

final class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizers : [Appetizer] = []
    @Published var alertItem : AlertItem?
    @Published var isLoading: Bool = true
    @Published var isShowingDetailView: Bool = false
    @Published var selectedAppetizer: Appetizer?
    
    func getAppetizers() {
        NetworkManager.shared.getAppetizers { [self] res in
            switch res {
            case .success(let data):
                self.appetizers = data
                isLoading = false
            case .failure(let error):
                switch error {
                case .invalidResponse:
                    alertItem = AlertContext.invalidResponse
                case .invalidURL:
                    alertItem = AlertContext.invalidURL
                case .invalidData:
                    alertItem = AlertContext.invalidData
                case .unableToComplete:
                    alertItem = AlertContext.unableToComplete
                }
            }
        }
    }
}
