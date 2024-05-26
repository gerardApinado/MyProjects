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
    
    func getAppetizers() {
        NetworkManager.shared.getAppetizers { [self] res in
            switch res {
            case .success(let data):
                self.appetizers = data
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
