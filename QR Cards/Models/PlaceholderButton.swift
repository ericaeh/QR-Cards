//
//  PlaceholderButton.swift
//  QR Cards
//
//  Created by Erica Heiermann on 13/11/2025.
//

import SwiftUI

struct PlaceholderButton: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        HStack{
            
            Button(){
                
            } label:{
                Text(" ")
                    .frame(width: UIScreen.main.bounds.width/2-40, height: 0.4*(UIScreen.main.bounds.width/2-40))
                    .font(.title)
                    .foregroundColor(.white)
            }
            
            .buttonStyle(PlainButtonStyle())
            .background(RoundedRectangle(cornerRadius: 40).fill(Color(UIColor.systemBackground)))
            
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
            
            
            
        }
    }
}

#Preview {
    
    HStack{
        BackButton()
        PlaceholderButton()
    }
}
