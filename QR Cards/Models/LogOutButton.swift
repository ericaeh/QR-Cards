//
//  LogOutButton.swift
//  QR Cards
//
//  Created by Erica Heiermann on 15/01/2026.
//

import SwiftUI

struct LogOutButton: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        
        GeometryReader{ geometry in
            
            Button(){
                viewModel.signOut()
            } label:{
                Text("Log Out")
                    .frame(maxWidth: geometry.size.width*0.9, maxHeight: geometry.size.width*0.9)
                    .font(.title)
                    .foregroundColor(.white)
            }
            
            .buttonStyle(PlainButtonStyle())
            .background(RoundedRectangle(cornerRadius: 40).fill(Color(UIColor.systemGray3)))
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            
            
            
        }
    }
}

#Preview {
    VStack {
        
        HStack {
            LogOutButton()
            SingleButton(buttonTitle: "Hello")
        }
        HStack {
            SingleButton(buttonTitle: "Hello")
            SingleButton(buttonTitle: "Hello")
        }
        HStack {
            SingleButton(buttonTitle: "Hello")
            SingleButton(buttonTitle: "Hello")
        }
        
    }
}
