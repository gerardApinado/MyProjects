//
//  FirebaseLoginView.swift
//  UserAuthFirebase
//
//  Created by Gerard on 6/5/24.
//

import SwiftUI

struct FirebaseLoginView: View {
    
//    @Binding var isPresented: Bool
    @State var email: String = ""
    @State var password: String = ""
    @EnvironmentObject var viewModel : FirebaseLoginViewModel
    
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
                    
                HeaderImage(imageName: "firebase_logo")
                
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
                    Task {
//                        try await viewModel.createUser(withEmail:password:fullName:)
                    }
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
    FirebaseLoginView()
}
