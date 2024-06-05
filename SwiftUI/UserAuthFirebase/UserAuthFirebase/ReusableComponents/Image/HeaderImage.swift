//
//  HeaderImage.swift
//  UserAuthFirebase
//
//  Created by Gerard on 6/5/24.
//

import SwiftUI

struct HeaderImage: View {
    let imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 250)
            .padding(.vertical, 32)
    }
}

#Preview {
    HeaderImage(imageName: "localhost_logo")
}
