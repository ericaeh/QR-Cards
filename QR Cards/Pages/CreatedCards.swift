//
//  CreatedCards.swift
//  QR Cards
//
//  Created by Erica Heiermann on 11/11/2025.
//

import SwiftUI

struct CreatedCards: View {
    var body: some View {
        VStack {
            Text("Created Cards")
                .font(.system(size: 60))
            
            Spacer()
            
            HStack {
                BackButton()
                PlaceholderButton()
            }
        }
    }
}

#Preview {
    CreatedCards()
}
