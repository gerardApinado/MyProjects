//
//  ContentView.swift
//  UserAuthFirebase
//
//  Created by Gerard on 6/5/24.
//

import SwiftUI

enum AuthMethod {
    case firebase
    case local
}

struct AuthenticationView: View {
    
    @StateObject var viewModel = AuthenticationViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Choose Authentication Method")
                    .font(.title)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                
                AuthButton(title: "Firebase") {
                    viewModel.selectedAuthMethod = .firebase
                }
                .padding()
                
                AuthButton(title: "Localhost") {
                    viewModel.selectedAuthMethod = .local
                }
            }
            .navigationTitle("")
            .padding()
            .fullScreenCover(isPresented: $viewModel.isShowingLoginView, content: {
                switch viewModel.selectedAuthMethod {
                case .firebase:
                    FirebaseLoginView()
                case .local:
                    LocalhostLoginView()
                case .none:
                    AuthenticationView()
                }
            })
        }
    }
}

#Preview {
    AuthenticationView()
}

struct AuthButton: View {
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .frame(width: 150, height: 50)
                .background(Color.yellow)
                .clipShape(.buttonBorder)
        }
        
    }
}
