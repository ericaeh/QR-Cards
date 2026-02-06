//
//  ChildHomePage.swift
//  QR Cards
//
//  Created by Erica Heiermann on 31/10/2025.
//

import SwiftUI

struct ChildHomePage: View {
    var body: some View {
        NavigationStack {
            VStack {
                
                Text("Home")
                    .font(.system(size: 60))
                    
                    
                
                
                    
                    HStack {
                        NavigationLink(destination: CardCollection()) {
                            SingleButton(buttonTitle: "Card Collection")
                        }
                        NavigationLink(destination: PlayGame()) {
                            SingleButton(buttonTitle: "Play Game")
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
    ChildHomePage()
}
