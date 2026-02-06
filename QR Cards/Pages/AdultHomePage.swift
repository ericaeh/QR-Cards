//
//  AdultHomePage.swift
//  QR Cards
//
//  Created by Erica Heiermann on 11/11/2025.
//

import SwiftUI

struct AdultHomePage: View {
    var body: some View {
        NavigationStack {
            VStack {
                
                Text("Home")
                    .font(.system(size: 60))
                    
                    
                
                
                    
                    HStack {
                        NavigationLink(destination: CreateCards()) {
                            SingleButton(buttonTitle: "Create \nCards")
                        }
                        NavigationLink(destination: CreatedCards()) {
                            SingleButton(buttonTitle: "View Created Cards")
                        }
                    }
                    //.offset(y: 130)
                    HStack {
                        NavigationLink(destination: CodeScanner()) {
                            SingleButton(buttonTitle: "Code Scanner")
                        }
                        NavigationLink(destination: HowToPlay()) {
                            SingleButton(buttonTitle: "How to \nPlay")
                        }
                    }
                    //.offset(y: 90)
                    HStack {
                        LogOutButton()
                        ImageButton()
                        
                    }
                    //.offset(y: 50)
                    
                
                
            }
            .padding()
            .navigationBarBackButtonHidden(true)
        }
        
    }
}

#Preview {
    AdultHomePage()
}
