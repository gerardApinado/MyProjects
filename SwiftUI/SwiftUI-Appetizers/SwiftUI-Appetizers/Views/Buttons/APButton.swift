//
//  APbutton.swift
//  SwiftUI-Appetizers
//
//  Created by Gerard on 5/29/24.
//

import SwiftUI

struct APButton: View {
    let title: String
    
    var body: some View {
        Text(title)
            .foregroundColor(.white)
            .frame(width: 250, height: 50)
            .fontWeight(.bold)
            .background(Color("brandPrimary"))
            .cornerRadius(10)
    }
}

#Preview {
    APButton(title: "99.66")
}
