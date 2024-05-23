//
//  FrameworkViewModel.swift
//  SwiftUI-Frameworks
//
//  Created by Gerard on 5/23/24.
//

import Foundation
import UIKit

class FrameworkViewModel : ObservableObject {
    
    var selectedFramework: Framework? {
        didSet { isShowingDetailView = true}
    }
    
    @Published var isShowingDetailView = false
}
