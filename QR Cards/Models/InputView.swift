//
//  InputView.swift
//  QR Cards
//
//  Created by Erica Heiermann on 31/01/2026.
//

import SwiftUI

struct InputView: View {
    @Binding var text: String
    let title: String
    let placeholder: String
    var isSecureField = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12){
            Text(title)
            if isSecureField {
                SecureField(placeholder, text: $text)
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                    .clipShape(.rect(cornerRadius: 20))
            } else {
                TextField(placeholder, text: $text)
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                    .clipShape(.rect(cornerRadius: 20))
            }
            
            
        }
    }
}

#Preview {
    InputView(text: .constant(""), title: "Email Address", placeholder: "name@example.com" )
}
