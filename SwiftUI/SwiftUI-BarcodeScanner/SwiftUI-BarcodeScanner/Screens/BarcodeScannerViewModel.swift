//
//  BarcodeScannerViewModel.swift
//  SwiftUI-BarcodeScanner
//
//  Created by Gerard on 5/23/24.
//

import SwiftUI

class BarcodeScannerViewModel: ObservableObject {
    @Published var scannedCode = ""
    @Published var alertItem: AlertItem?
    
    var statusText: String {
        scannedCode.isEmpty ? "Not Yet Scanned" : scannedCode
    }
    
    var statusColor: Color {
        scannedCode.isEmpty ? .red : .green
    }
}
