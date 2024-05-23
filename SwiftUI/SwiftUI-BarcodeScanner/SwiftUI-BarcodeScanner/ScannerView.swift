//
//  ScannerView.swift
//  SwiftUI-BarcodeScanner
//
//  Created by Gerard on 5/23/24.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    
    @Binding var scannedCode: String
    
    func makeUIViewController(context: Context) -> ScannerVC {
        ScannerVC(scannerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) { }
    
    func makeCoordinator() -> ScannerCoordination {
        ScannerCoordination(scannerView: self)
    }
    
    final class ScannerCoordination: NSObject, ScannerVCDelegate {
        private let scannerView: ScannerView
        
        init(scannerView: ScannerView) {
            self.scannerView = scannerView
        }
        
        func didFind(barcode: String) {
            print(barcode)
            scannerView.scannedCode = barcode
        }
        
        func didSurface(error: CameraError) {
            print(error.rawValue)
        }
        
        
    }
}

#Preview {
    ScannerView(scannedCode: .constant(""))
}
