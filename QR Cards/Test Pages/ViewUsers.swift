//
//  ViewUsers.swift
//  QR Cards
//
//  Created by Erica Heiermann on 04/02/2026.
//

import SwiftUI

struct ViewUsers: View {
    @EnvironmentObject var dataManager: DataManager
    
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Users")
                .font(.title)
            
            Text("Adults")
                .padding(.top)
            ForEach(dataManager.adults, id: \.id) { adult in
                Text("\(adult.username): \(adult.email)")
            }
            
            Text("Children")
                .padding(.top)
                .font(.title3)
            ForEach(dataManager.children, id: \.id) { child in
                Text("\(child.username): \(child.email)")
            }
            
            Text("Sets")
                .padding(.top)
                .font(.title3)
            ForEach(dataManager.sets, id: \.id) { set in
                Text("\(set.name): \(set.adult_id)")
            }
            
            Text("Set Names")
                .padding(.top)
                .font(.title3)
            ForEach(dataManager.setNames, id: \.self) {
                Text($0)
            }
            
        }
        
    }
}

#Preview {
    ViewUsers()
        .environmentObject(DataManager())
}
