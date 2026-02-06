//
//  SignUpView.swift
//  QR Cards
//
//  Created by Erica Heiermann on 31/01/2026.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var email = ""
    @State private var username = ""
    @State private var password = ""
    @State private var accountType = "Adult"
    @State private var associatedAdult = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    
    var body: some View {
        VStack {
            //image
            if (colorScheme == .light) {
                Image("logo_black")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 300)
                    //.offset(y: -20)
                    //.padding(.vertical, 32)
            } else {
                Image("logo_white")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 300)
                    //.padding(.vertical, 32)
            }
            
            //form fields
            VStack(spacing: 12) {
                HStack {
                    Text("Account Type: ")
                    Spacer()
                    Picker("AccountType", selection: $accountType) {
                        Text("Adult").tag("Adult"); Text("Child").tag("Child")
                    }
                }
                
                InputView(text: $username,
                          title: "Username",
                          placeholder: "Enter your name")
                .textInputAutocapitalization(.words)
                .autocorrectionDisabled()
                
                InputView(text: $email,
                          title: "Email Address",
                          placeholder: "name@example.com")
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
                .autocorrectionDisabled()
                
                InputView(text: $password,
                          title: "Password",
                          placeholder: "Enter your password",
                          isSecureField: true)
                
                if (accountType == "Child") {
                    InputView(text: $associatedAdult,
                              title: "Parent/Teacher",
                              placeholder: "Enter the name of your parent or teacher")
                }
                
                
            }
            .padding(.horizontal)
            
            Spacer()
            
            HStack{
                BackButton()
                
                //sign up button
                Button {
                    Task {
                        if accountType == "Adult" {
                            try await viewModel.createAdult(withEmail: email, password: password, username: username)
                        } else {
                            try await viewModel.createChild(withEmail: email, password: password, username: username, associatedAdult: associatedAdult)
                        }
                    }
                } label: {
                    Text("Sign Up")
                        .font(.title)
                        .foregroundColor(.white)
                }
                .frame(width: UIScreen.main.bounds.width/2-40, height: 0.4*(UIScreen.main.bounds.width/2-40))
                .background(RoundedRectangle(cornerRadius: 40).fill(Color(UIColor.systemGray3)))
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1.0 : 0.5)
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
            }
            
//            Spacer()
//            Button {
//                dismiss()
//            } label: {
//                Text("Already have an account, sign in")
//            }
            
            
        }
        .navigationBarBackButtonHidden()
    }
}

extension SignUpView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
        && !username.isEmpty
        //make this check adult exists
       // && (accountType == "Adult" || associatedAdult in
    }
}

#Preview {
    SignUpView()
}
