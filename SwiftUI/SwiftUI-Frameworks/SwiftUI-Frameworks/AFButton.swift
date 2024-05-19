//
//  AFButton.swift
//  SwiftUI-Frameworks
//
//  Created by Gerard on 4/4/24.
//

import SwiftUI

struct AFButton: View {
    let title: String
    
    var body: some View {
        Button {
//            print("tap tap")
        } label: {
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
                .frame(width: 280, height: 50)
                .background(.blue)
                .foregroundStyle(.white)
//                    .clipShape(.buttonBorder)
                .cornerRadius(10)
        }
    }
}

#Preview {
    AFButton(title: "Test Title")
}
