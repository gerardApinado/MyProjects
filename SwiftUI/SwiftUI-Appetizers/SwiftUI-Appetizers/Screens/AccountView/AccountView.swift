//
//  AccountView.swift
//  SwiftUI-Appetizers
//
//  Created by Gerard on 5/25/24.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject private var viewModel = AccountViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Info").padding(.leading, -18)) {
                    TextField("First Name", text: $viewModel.firstName)
                    TextField("Last Name", text: $viewModel.lastName)
                    TextField("Email", text: $viewModel.email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                    DatePicker("Birthday", selection: $viewModel.birthdate, displayedComponents: .date)
                    
                    Button {
                        
                    } label: {
                        Text("Save Changes")
                    }
                }

                
                Section(header: Text("Requests").padding(.leading, -18)) {
                    Toggle("Extra Napkins", isOn: $viewModel.extraNapkins)
                        
                    Toggle("Frequent Refills", isOn: $viewModel.frequentRefill)
                        
                }
                .toggleStyle(SwitchToggleStyle(tint: Color("brandPrimary")))
            }
            .navigationTitle("Account")
        }
    }
}

#Preview {
    AccountView()
}
