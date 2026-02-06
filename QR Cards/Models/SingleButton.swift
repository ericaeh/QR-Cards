//
//  SingleButton.swift
//  QR Cards
//
//  Created by Erica Heiermann on 11/11/2025.
//

import SwiftUI

struct SingleButton: View {
    var buttonTitle: String

    var body: some View {
        
        GeometryReader{ geometry in
            
            Button(){
                
            } label:{
                Text("\(buttonTitle)")
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
            SingleButton(buttonTitle: "Hi")
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
