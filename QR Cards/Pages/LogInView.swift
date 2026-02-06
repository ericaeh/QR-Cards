//
//  LogInView.swift
//  QR Cards
//
//  Created by Erica Heiermann on 31/01/2026.
//

import SwiftUI

struct LogInView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                //image
                if (colorScheme == .light) {
                    Image("logo_black")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 300, height: 300)
                } else {
                    Image("logo_white")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 300, height: 300)
                }
                
                //title
                Text("Log In")
                    .font(.system(size: 40))
                    .padding(.bottom, 16)
                
                
                //form fields
                VStack(spacing: 12) {
                    InputView(text: $email,
                              title: "Email Address",
                              placeholder: "name@example.com")
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                    
                    InputView(text: $password,
                              title: "Password",
                              placeholder: "Enter your password",
                              isSecureField: true)
                }
                .padding(.horizontal)
                
                //sign in button
                Spacer()
                HStack{
                    BackButton()
                    
                    //sign in button
                    Button {
                        Task {
                            try await viewModel.signIn(withEmail: email, password: password)
                        }
                    } label: {
                        Text("Sign in")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                    .frame(width: UIScreen.main.bounds.width/2-40, height: 0.4*(UIScreen.main.bounds.width/2-40))
                    .background(RoundedRectangle(cornerRadius: 40).fill(Color(UIColor.systemGray3)))
                    .disabled(!formIsValid)
                    .opacity(formIsValid ? 1.0 : 0.5)
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
                }
                
//                Spacer()
//                
//                //sign up button
//                
//                NavigationLink {
//                    SignUpView()
//                        .navigationBarBackButtonHidden()
//                } label: {
//                    Text("Sign Up")
//                }

            
            }
        }
        .navigationBarBackButtonHidden()
    }
}


extension LogInView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
    }
}

#Preview {
    LogInView()
}
