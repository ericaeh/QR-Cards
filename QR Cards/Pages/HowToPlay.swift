//
//  HowToPlay.swift
//  QR Cards
//
//  Created by Erica Heiermann on 11/11/2025.
//

import SwiftUI

struct HowToPlay: View {
    var body: some View {
        VStack{
            Text("How to Play")
                .font(.system(size: 60))
            
            Text("Each app just shuffles the cards of a particular set so the children must sit together irl. Every time they lose a comparison, they lose that card. Last child remaining wins")
                .font(.system(size: 30))
                .padding(.horizontal, 30)
                .padding(.top, 10)
                .padding(.bottom, 30)
            
            HStack{
                BackButton()
                PlaceholderButton()
            }
            
        }
    }
}

#Preview {
    HowToPlay()
}
