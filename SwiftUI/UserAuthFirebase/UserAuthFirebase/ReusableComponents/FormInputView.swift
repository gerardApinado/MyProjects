//
//  FormInputView.swift
//  UserAuthFirebase
//
//  Created by Gerard on 6/5/24.
//

import SwiftUI

struct FormInputView: View {
    
    @Binding var text: String
    var title: String
    var placeholder: String
    var isSecureField = false
    
    var body: some View {
        VStack(alignment:.leading, spacing: 12) {
            Text(title)
                .fontWeight(.semibold)
                .foregroundColor(Color(.darkGray))
                .font(.footnote)
            
            if isSecureField {
                SecureField(placeholder, text: $text)
                    .font(.system(size: 14))
            } else {
                TextField(placeholder, text: $text)
                    .font(.system(size: 14))
            }
            
            Divider()
        }
        .padding(.horizontal)
    }
}

#Preview {
    FormInputView(text: .constant(""), title: "Email Address", placeholder: "youremail@email.com")
}
