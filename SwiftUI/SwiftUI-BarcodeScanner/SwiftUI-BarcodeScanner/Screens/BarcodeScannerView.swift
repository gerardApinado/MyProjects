//
//  ContentView.swift
//  SwiftUI-BarcodeScanner
//
//  Created by Gerard on 5/23/24.
//

import SwiftUI



struct BarcodeScannerView: View {
    
    @StateObject var viewModel = BarcodeScannerViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, maxHeight: 300)
                    
                    ScannerView(scannedCode: $viewModel.scannedCode, alertItem: $viewModel.alertItem)
                        .frame(maxWidth: .infinity, maxHeight: 300)
                        .border(Color.black, width: 1)
                }
                
                Spacer().frame(height: 60)
                
                Label("Scanned Barcode:", systemImage: "barcode.viewfinder")
                    .font(.title)
                
                Text(viewModel.statusText)
                    .bold()
                    .font(.largeTitle)
                    .foregroundStyle(viewModel.statusColor)
                    .padding()
                
                
            }
            .navigationTitle("Barcode Scanner")
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: Text(alertItem.title),
                      message: Text(alertItem.message),
                      dismissButton: alertItem.dismissButton)
            }
        }
    }
}

#Preview {
    BarcodeScannerView()
}
