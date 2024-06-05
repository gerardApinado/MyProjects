//
//  SettingsRowView.swift
//  UserAuthFirebase
//
//  Created by Gerard on 6/5/24.
//

import SwiftUI

struct SettingsRowView: View {
    
    let imageName: String
    let title: String
    let subTitle: String
    let tintColor: Color
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: imageName)
                .foregroundColor(tintColor)
                .clipShape(Circle())
                
            Text(title)
                .font(.subheadline)
                .foregroundColor(.black)
            
            Spacer()
            
            Text(subTitle)
                .font(.subheadline)
                .foregroundColor(Color(.systemGray))
            
        }
    }
}

#Preview {
    SettingsRowView(imageName: "gear", title: "Version", subTitle: "1.0.0", tintColor: Color(.systemGray))
}
