//
//  XDismissButton.swift
//  SwiftUI-Frameworks
//
//  Created by Gerard on 5/23/24.
//

import SwiftUI

struct XDismissButton: View {
    
    @Binding var isShowingDetailView: Bool
    var tintColor: Color = .white
    
    var body: some View {
        HStack {
            Spacer()
            
            Button {
                isShowingDetailView = false
            } label: {
                Image(systemName: "xmark")
                    .foregroundStyle(tintColor)
            }
            .padding()
        }
    }
}

#Preview {
    XDismissButton(isShowingDetailView: .constant(false))
}
