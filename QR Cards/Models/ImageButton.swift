//
//  ImageButton.swift
//  QR Cards
//
//  Created by Erica Heiermann on 11/11/2025.
//

import SwiftUI


struct ImageButton: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        
        GeometryReader{ geometry in
            Button(){
                
            } label:{
                if (colorScheme == .light) {
                    Image("logo_black")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: geometry.size.width*0.9, maxHeight: geometry.size.width*0.9)
                } else {
                    Image("logo_white")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: geometry.size.width*0.9, maxHeight: geometry.size.width*0.9)
                }
            }
            
            .buttonStyle(PlainButtonStyle())
            .background(RoundedRectangle(cornerRadius: 30).fill(Color(UIColor.systemBackground)))
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            
            
            
        }
    }
}
#Preview {
    VStack{
        HStack{
            ImageButton()
            ImageButton()
        }
        HStack{
            ImageButton()
            ImageButton()
        }
        HStack{
            ImageButton()
            ImageButton()
        }
    }
}
