//
//  ContentView.swift
//  QR Cards
//
//  Created by Erica Heiermann on 31/10/2025.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        if let user = viewModel.currentUser, viewModel.userSession != nil {
            if user.accountType == "Adult" {
                AdultHomePage()
            } else {
                ChildHomePage()
            }
        } else if viewModel.userSession == nil {
            
            NavigationStack{
                VStack {
                    if colorScheme == .light {
                        Image("logo_black")
                            .resizable()
                            .frame(width: 400, height: 400)
                    } else {
                        Image("logo_white")
                            .resizable()
                            .frame(width: 400, height: 400)
                    }
                    
                    Text("Welcome to QR Cards!")
                        .font(.largeTitle)
                    
                    VStack{
                        NavigationLink(destination:
                                        SignUpView()
                        ) {
                            WideButton(buttonTitle: "Sign Up")
                                .contentShape(Rectangle())
                        }
                        
                        NavigationLink(destination: LogInView()) {
                            WideButton(buttonTitle: "Log In")
                        }
                    }
                    
                }
                .padding()
                .font(.largeTitle)
                .navigationBarBackButtonHidden(true)
            }
        }
    }
    
}


#Preview {
    ContentView()
        .environmentObject(AuthViewModel())
}
