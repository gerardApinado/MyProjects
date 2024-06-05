//
//  FirebaseLoginView.swift
//  UserAuthFirebase
//
//  Created by Gerard on 6/5/24.
//

import SwiftUI

struct FirebaseLoginView: View {
    
    @Binding var isPresented: Bool
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
//                HStack {
//                    Button {
//                        isPresented.toggle()
//                    } label: {
//                        Label("Back", systemImage: "arrow.left")
//                    }
//                    .padding(.leading)
//                    
//                    Spacer()
//                }
//                Spacer()
                    
                Image("firebase_logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                    .padding(.vertical, 32)
                
                VStack(spacing: 24) {
                    FormInputView(text: $email,
                                  title: "Email Address",
                                  placeholder: "Enter your email")
                    .autocapitalization(.none)
                    
                    FormInputView(text: $password,
                                  title: "Password",
                                  placeholder: "Enter your password",
                                  isSecureField: true)
                }
                .padding(.top, 15)
                
                Button {
                    
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
                    LocalhostLoginView()
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
    FirebaseLoginView(isPresented: .constant(false))
}
