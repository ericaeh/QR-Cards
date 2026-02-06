//
//  WideButton.swift
//  QR Cards
//
//  Created by Erica Heiermann on 13/11/2025.
//

import SwiftUI

struct WideButton: View {
    var buttonTitle: String

    var body: some View {
        
        GeometryReader{ geometry in
            
            Button(){
                
            } label:{
                Text("\(buttonTitle)")
                    .frame(maxWidth: geometry.size.width*0.9, maxHeight: geometry.size.width*0.3)
                    .font(.title)
                    .foregroundColor(.white)
            }
            
            .buttonStyle(PlainButtonStyle())
            .background(RoundedRectangle(cornerRadius: 40).fill(Color(UIColor.systemGray3)))
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 10))
            
            
            
        }
    }
}

#Preview {
    VStack {
        
        WideButton(buttonTitle: "Hi")
        WideButton(buttonTitle: "Hello")
        WideButton(buttonTitle: "Hi")
        
    }
}
