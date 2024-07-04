//
//  LocalhostLoginView.swift
//  UserAuthFirebase
//
//  Created by Gerard on 6/5/24.
//

import SwiftUI

struct LocalhostLoginView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                    
                HeaderImage(imageName: "localhost_logo")
                
                VStack(spacing: 24) {
                    FormInputView(text: $email,
                                  title: "Username",
                                  placeholder: "Enter your username")
                    .autocapitalization(.none)
                    
                    FormInputView(text: $password,
                                  title: "Password",
                                  placeholder: "Enter your password",
                                  isSecureField: true)
                }
                .padding(.top, 15)
                
                NavigationLink {
                    ProfileView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack {
                        Text("Sign In")
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                }
                .background(Color(.systemBlue))
                .cornerRadius(10)
                .padding(.top, 24)
                
                Spacer()
                
                NavigationLink {
                    FirebaseRegisterView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack{
                        Text("Don't have an account?")
                        Text("Sign Up")
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 14))
                }

            }
        }
    }
}

#Preview {
    LocalhostLoginView()
}
