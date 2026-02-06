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
        
        GeometryReader{ geometry in
            
            Button(){
                
            } label:{
                Text(" ")
                    .frame(maxWidth: geometry.size.width*0.8, maxHeight: geometry.size.width*0.3)
                    .font(.title)
                    .foregroundColor(.white)
            }
            
            .buttonStyle(PlainButtonStyle())
            .background(RoundedRectangle(cornerRadius: 40).fill(Color(UIColor.systemBackground)))
            
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 10))
            
            
            
        }
    }
}

#Preview {
    
    HStack{
        BackButton()
        PlaceholderButton()
    }
}
