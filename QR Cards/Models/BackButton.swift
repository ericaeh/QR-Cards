//
//  BackButton.swift
//  QR Cards
//
//  Created by Erica Heiermann on 13/11/2025.
//

import SwiftUI

struct BackButton: View {
    @Environment(\.presentationMode) private var presentationMode: Binding <PresentationMode>
    var body: some View {

            
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Text("Back")
                .frame(width: UIScreen.main.bounds.width/2-40, height: 0.4*(UIScreen.main.bounds.width/2-40))
                .font(.title)
                .foregroundColor(.white)
        }
        )
        .buttonStyle(PlainButtonStyle())
        .background(RoundedRectangle(cornerRadius: 40).fill(Color(UIColor.systemGray3)))
        .onTapGesture {
            presentationMode.wrappedValue.dismiss()
        }
        .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
        
        
            
    }
}

#Preview {
    HStack{
        BackButton()
        BackButton()
    }
}
