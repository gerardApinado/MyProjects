//
//  ContentView.swift
//  UserAuthFirebase
//
//  Created by Gerard on 6/5/24.
//

import SwiftUI

struct AuthenticationView: View {
    
    @EnvironmentObject var viewModel : FirebaseLoginViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Choose Authentication Method")
                    .font(.title)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                
                NavigationLink {
                    Group {
                        if let viewmodel = viewModel.userSession {
                            ProfileView()
                        } else {
                            FirebaseLoginView()
                        }
                    }
                } label: {
                    AuthMethodButton(title: "Firebase", img: "firebase_icon")
                }
                .padding(.bottom)
                
                NavigationLink {
                    LocalhostLoginView()
                } label: {
                    AuthMethodButton(title: "Localhost", img: "localhost_icon")
                }
            }
        }
    }
}

#Preview {
    AuthenticationView()
}

struct AuthMethodButton: View {
    let title: String
    let img: String
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundStyle(.white)
                .frame(alignment: .trailing)
                .padding(.leading)
            
            Image(img)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
        }
        .frame(width: 250, height: 50)
        .background(Color(.systemBlue))
        .cornerRadius(10)
    }
}
