//
//  AFButton.swift
//  SwiftUI-Frameworks
//
//  Created by Gerard on 4/4/24.
//

import SwiftUI

struct AFButton: View {
    
    @Binding var isShowingSafariView: Bool
    let title: String
    
    
    var body: some View {
        Button {
            isShowingSafariView = true
        } label: {
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
                .frame(width: 280, height: 50)
                .background(.blue)
                .foregroundStyle(.white)
                .cornerRadius(10)
        }
    }
}

#Preview {
    AFButton(isShowingSafariView: .constant(false), title: "Test Title")
}
