//
//  AppetizerListCell.swift
//  SwiftUI-Appetizers
//
//  Created by Gerard on 5/25/24.
//

import Foundation
import SwiftUI

struct AppetizerListCell: View {
    let data : Appetizer
    
    var body: some View {
        HStack {
            AppetizerRemoteImage(urlString: data.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 100)
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(data.name)
                    .fontWeight(.medium)
                    .font(.title2)
                
                Text("$\(data.price, specifier: "%.2f")")
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
            
        }
    }
}
