//
//  XDismissButton.swift
//  SwiftUI-Appetizers
//
//  Created by Gerard on 5/29/24.
//

import SwiftUI

struct XDismissButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundStyle(.white)
                .opacity(0.6)
                .shadow(radius: 10)
            
            Image(systemName: "xmark")
                .imageScale(.small)
                .foregroundColor(.black)
        }
        .padding(5)
    }
}

#Preview {
    XDismissButton()
}
