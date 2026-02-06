//
//  LogIn.swift
//  QR Cards
//
//  Created by Erica Heiermann on 13/11/2025.
//

import SwiftUI
import Firebase
import FirebaseAuth

enum LogInFocus: Int, Hashable {
    case name, email, password
}

struct LogIn: View {
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @FocusState var focusedField: LogInFocus?
    @Environment(\.colorScheme) var colorScheme
    var isSubmitButtonActive: Bool {
        isValidEmail(string: email) && name.count >= 5 && password.count >= 8
    }
    

    var body: some View {
        VStack(spacing: 16) {
            if (colorScheme == .light) {
                Image("logo_black")
                    .resizable()
                    .frame(width: 300, height: 300)
                    .offset(y: -50)
            } else {
                Image("logo_white")
                    .resizable()
                    .frame(width: 300, height: 300)
                    .offset(y: -50)
            }
            Text("Log In")
                .font(.largeTitle)
                .padding(.bottom, 16)
 
            

            TextField(text: $name) {
                Text("Name")
            }
            .autocorrectionDisabled()
            .textInputAutocapitalization(.words)
            .focused($focusedField, equals: .name)
            .padding()
            .background(Color(UIColor.secondarySystemBackground))
            .clipShape(.rect(cornerRadius: 20))
            .onTapGesture {
                focusedField = .name
            }
            .textContentType(.name)
            .submitLabel(.next)
            .onSubmit {
                focusedField = .email
            }
            
            
            
            TextField(text: $email) {
                Text("Email")
            }
            .autocorrectionDisabled()
            .keyboardType(.emailAddress)
            .focused($focusedField, equals: .email)
            .padding()
            .background(Color(UIColor.secondarySystemBackground))
            .clipShape(.rect(cornerRadius: 20))
            .onTapGesture {
                focusedField = .email
            }
            .textContentType(.emailAddress)
            .submitLabel(.next)
            .onSubmit {
                focusedField = .password
            }
            
            
            
            SecureField(text: $password) {
                Text("Password")
            }
            .focused($focusedField, equals: .password)
            .padding()
            .background(Color(UIColor.secondarySystemBackground))
            .clipShape(.rect(cornerRadius: 20))
            .onTapGesture {
                focusedField = .password
            }
            //for login/existing account
            //.textContentType(.password)
            //for sign up
            //.textContentType(.newPassword
            .textContentType(.password)
            .submitLabel(.go)
            .onSubmit {
                if (isValidEmail(string: email) && name.count >= 5 && password.count >= 8){
                    login()
                }
            }

            Spacer()

            HStack{
                BackButton()
                GeometryReader{ geometry in
                    Button {
                        login()
                    } label: {
                        Text("Enter")
                            .frame(maxWidth: geometry.size.width*0.8, maxHeight: geometry.size.width*0.3)
                            .font(.title)
                            .foregroundColor(.white)
                        
                    }
                    .disabled(!isSubmitButtonActive)
                    .buttonStyle(PlainButtonStyle())
                    .background(RoundedRectangle(cornerRadius: 40).fill(Color(UIColor.systemGray3)))
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 10))
                }
            }
            .onAppear {
                Auth.auth().addStateDidChangeListener { auth, user in if user != nil {
                    }
                    
                }
            }
       
            


            
        }
        .padding(40)
        .navigationBarBackButtonHidden(true)
        

    }

    
    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in if error != nil {
            print(error!.localizedDescription)
            }
        }
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in if error != nil {
            print(error!.localizedDescription)
            }
        }
    
    }
    func isValidEmail(string: String) -> Bool {
        let emailRegex = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$/
            .ignoresCase()
        return !string.ranges(of: emailRegex).isEmpty
    }
}




#Preview {
    LogIn()
}
