//
//  AccountView.swift
//  SwiftUI-Appetizers
//
//  Created by Gerard on 5/25/24.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject private var viewModel = AccountViewModel()
    @FocusState private var focusedTextField: FormTextField?
    
    enum FormTextField {
        case firstName, lastName, email
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Info").padding(.leading, -18)) {
                    TextField("First Name", text: $viewModel.user.firstName)
                        .submitLabel(.next)
                        .focused($focusedTextField, equals: .firstName)
                        .onSubmit {
                            focusedTextField = .lastName
                        }
                    
                    TextField("Last Name", text: $viewModel.user.lastName)
                        .submitLabel(.next)
                        .focused($focusedTextField, equals: .lastName)
                        .onSubmit {
                            focusedTextField = .email
                        }
                    
                    TextField("Email", text: $viewModel.user.email)
                        .focused($focusedTextField, equals: .email)
                        .onSubmit {
                            focusedTextField = nil
                        }
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                    
                    DatePicker("Birthday", selection: $viewModel.user.birthdate, displayedComponents: .date)
                    
                    Button {
                        viewModel.saveChanges()
                    } label: {
                        Text("Save Changes")
                    }
                }

                
                Section(header: Text("Requests").padding(.leading, -18)) {
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                        
                    Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefill)
                        
                }
                .toggleStyle(SwitchToggleStyle(tint: Color("brandPrimary")))
            }
            .navigationTitle("Account")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Dismiss") {
                        focusedTextField = nil
                    }
                }
            }
        }
        .onAppear {
            viewModel.retriveUser()
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: Text(alertItem.title),
                  message: Text(alertItem.message),
                  dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    AccountView()
}
