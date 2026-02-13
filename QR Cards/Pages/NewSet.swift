//
//  NewSet.swift
//  QR Cards
//
//  Created by Erica Heiermann on 10/02/2026.
//

import SwiftUI

struct NewSet: View {
    @StateObject var dataManager = DataManager()
    @StateObject var viewModel = AuthViewModel()
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    @State private var stat1 = ""
    @State private var stat2 = ""
    @State private var stat3 = ""
    @State private var adult_id = ""
    
    
    var body: some View {
        VStack {
            Text("Add a Set")
                .font(.system(size: 60))
            
            InputView(text: $name,
                      title: "Name",
                      placeholder: "Enter Set Name")
            
            InputView(text: $stat1,
                      title: "Statistic 1",
                      placeholder: "Enter Statistic 1")
            
            InputView(text: $stat2,
                      title: "Statistic 2",
                      placeholder: "Enter Statistic 2")
            
            InputView(text: $stat3,
                      title: "Statistic 3",
                      placeholder: "Enter Statistic 3")
            
            Button {
                dataManager.createSet(name: name,
                                      stat1: stat1,
                                      stat2: stat2,
                                      stat3: stat3,
                                      adult_id: viewModel.currentUser!.id)
                dismiss()
                
            } label: {
                Text("Save")
                    .font(.title)
                    .foregroundColor(.white)
            }
            .frame(width: UIScreen.main.bounds.width/2-40, height: 0.4*(UIScreen.main.bounds.width/2-40))
            .background(RoundedRectangle(cornerRadius: 40).fill(Color(UIColor.systemGray3)))
            .disabled(!formIsValid)
            .opacity(formIsValid ? 1.0 : 0.5)
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
            
        }
        .padding()
    }
}

extension NewSet: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !name.isEmpty
        && !stat1.isEmpty
        && !stat2.isEmpty
        && !stat3.isEmpty
    }
}

#Preview {
    NewSet()
}
