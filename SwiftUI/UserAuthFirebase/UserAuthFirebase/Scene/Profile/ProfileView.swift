//
//  ProfileView.swift
//  UserAuthFirebase
//
//  Created by Gerard on 6/5/24.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var viewModel : FirebaseLoginViewModel
    
//    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        if let user = viewModel.currentUser {
            List {
                Section {
                    HStack {
                        Text(user.initials)
                            .font(.title)
                            .fontWeight(.bold)
                            .frame(width: 72, height: 72)
                            .background(Color(.systemGray3))
                            .foregroundColor(.white)
                            .clipShape(Circle())
                        VStack(alignment: .leading, spacing: 4) {
                            Text(user.fullName)
                                .fontWeight(.semibold)
                            Text(user.email)
                                .font(.footnote)
                                .foregroundStyle(Color(.darkGray))
                        }
                    }
                }
                
                Section("General") {
                    SettingsRowView(imageName: "gear",
                                    title: "Version",
                                    subTitle:"1.0.0",
                                    tintColor: Color(.systemGray))
                }
                
                Section("Account") {
                    SettingsRowView(imageName: "arrow.left.circle.fill",
                                    title: "Sign Out",
                                    subTitle:"",
                                    tintColor: .red)
                    .onTapGesture {
                        viewModel.signOut()
                    }
                    SettingsRowView(imageName: "xmark.circle.fill",
                                    title: "Delete Account",
                                    subTitle:"",
                                    tintColor: .red)
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
