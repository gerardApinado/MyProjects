//
//  FirebaseRegisterView.swift
//  UserAuthFirebase
//
//  Created by Gerard on 6/5/24.
//

import SwiftUI

struct FirebaseRegisterView: View {
    
    @State var email: String = ""
    @State var fullName: String = ""
    @State var password: String = ""
    @State var rePassword: String = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel : FirebaseLoginViewModel
    
    var body: some View {
            VStack {
                HeaderImage(imageName: "firebase_logo")
                
                VStack(spacing: 24) {
                    FormInputView(text: $email,
                                  title: "Email Address",
                                  placeholder: "Enter your email")
                    .autocapitalization(.none)
                    
                    FormInputView(text: $fullName,
                                  title: "Full Name",
                                  placeholder: "Enter your full name")
                    .autocapitalization(.none)
                    
                    FormInputView(text: $password,
                                  title: "Password",
                                  placeholder: "Enter your password",
                                  isSecureField: true)
                    
                    FormInputView(text: $rePassword,
                                  title: "Confirm Password",
                                  placeholder: "Re-enter your password",
                                  isSecureField: true)
                }
                .padding(.top, 15)
                
                Button {
                    Task {
                        try await viewModel.createUser(withEmail:email, password:password, fullName:fullName)
                    }
                } label: {
                    HStack {
                        Text("Sign Up")
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                }
                .background(Color(.systemBlue))
                .cornerRadius(10)
                .padding(.top, 24)
                
                Spacer()
                
                Button {
                    dismiss()
                } label: {
                    HStack{
                        Text("Already have an account?")
                        Text("Sign In")
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 14))
                }
            }
    }
}

#Preview {
    FirebaseRegisterView()
}
