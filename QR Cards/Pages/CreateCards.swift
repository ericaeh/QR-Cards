//
//  CreateCards.swift
//  QR Cards
//
//  Created by Erica Heiermann on 11/11/2025.
//

import SwiftUI
import PhotosUI

struct CreateCards: View {
    @State private var set: Set = Set(id: "H9s2elu30g1J1uIpkfbM", name: "Solar System", stat1: "Size (km)", stat2:
                                        "Temperature (°C)", stat3:
                                        "Moons", adult_id: "Erica Heiermann")
    @State private var title = ""
    @State private var photoItem: PhotosPickerItem?
    @State private var photoImage: Image?
    @State private var photoChosen = false
    @State private var factfile = ""
    @State private var value1 = ""
    @State private var value2 = ""
    @State private var value3 = ""
    @State private var showPopUp = false
    @EnvironmentObject var dataManager: DataManager
    
    
    var body: some View {
        VStack {
            Text("Create a Card")
                .font(.system(size: 60))
            
            Spacer()
            
            VStack {
                InputView(text: $title,
                          title: "",
                          placeholder: "Insert Title",
                          hasTitle: false)
                
                
                Group {
                    PhotosPicker("Insert Photo",
                                 selection: $photoItem,
                                 matching: .not(.videos))
                    .padding(.horizontal)
                    .padding(.vertical,2)
                    .background(Color(UIColor.secondarySystemBackground))
                    .clipShape(.rect(cornerRadius: 20))
                    
                    photoImage?
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: UIScreen.main.bounds.width*0.8-32, maxHeight: UIScreen.main.bounds.width*0.4 )
                        .clipShape(.rect(cornerRadius: 20))
                        .clipped()
                    
                    
                }
                .onChange(of: photoItem) {
                    Task {
                        if let loaded = try? await photoItem?.loadTransferable(type: Image.self) {
                            photoImage = loaded
                            photoChosen = true
                        } else {
                            print("DEBUG: Failed to load image")
                        }
                    }
                    
                }
                
                if !photoChosen {
                    Rectangle()
                        .scaledToFill()
                        .frame(maxWidth: UIScreen.main.bounds.width*0.8-32, maxHeight: UIScreen.main.bounds.width*0.4 )
                        .foregroundColor(Color(UIColor.secondarySystemBackground))
                        .clipShape(.rect(cornerRadius: 20))
                }
                
                InputView(text: $factfile,
                          title: "",
                          placeholder: "Insert Factfile",
                          hasTitle: false)
                .padding(.bottom)
                
                
                HStack {
                    Text("\(set.stat1):   ")
                    InputView(text: $value1,
                              title: "",
                              placeholder: "Insert Value",
                              hasTitle: false)
                }
                
                HStack {
                    Text("\(set.stat2):   ")
                    InputView(text: $value2,
                              title: "",
                              placeholder: "Insert Value",
                              hasTitle: false)
                }
                
                HStack {
                    Text("\(set.stat3):   ")
                    InputView(text: $value3,
                              title: "",
                              placeholder: "Insert Value",
                              hasTitle: false)
                }
                
                
                
                
                
            }
            .padding()
            .frame(maxWidth: UIScreen.main.bounds.width*0.8)
            .background(Color(UIColor.gray))
            .clipShape(.rect(cornerRadius: 40))
            
            
            HStack {
                Text("Set:  ")
                    .font(.title2)
                Picker("Set", selection: $set) {

                    ForEach(dataManager.sets, id: \.id) { set in
                        Text(set.name).tag(set)
                    }
                }
                .padding()
                .frame(maxWidth: UIScreen.main.bounds.width*0.8)
                .background(Color(UIColor.secondarySystemBackground))
                .clipShape(.rect(cornerRadius: 20))
                
                Button {
                    showPopUp.toggle()
                } label: {
                    Image(systemName: "plus")
                }
                .sheet(isPresented: $showPopUp) {
                    NewSet()
                }

            }
            .frame(maxWidth: UIScreen.main.bounds.width*0.8-32)
            
            
            
            HStack {
                BackButton()
                
                Button {
                    Task {
                        dataManager.createCard(set_id: set.id, title: title, photo: photoImage!, factfile: factfile, value1: value1, value2: value2, value3: value3)
                    }
                } label: {
                    Text("Create")
                        .font(.title)
                        .foregroundColor(.white)
                }
                .frame(width: UIScreen.main.bounds.width/2-40, height: 0.4*(UIScreen.main.bounds.width/2-40))
                .background(RoundedRectangle(cornerRadius: 40).fill(Color(UIColor.systemGray3)))
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1.0 : 0.5)
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
            }
        }
        
    }
}

extension CreateCards: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !title.isEmpty
        && photoChosen
        && !factfile.isEmpty
        && !value1.isEmpty
        && !value2.isEmpty
        && !value3.isEmpty
    }
}

#Preview {
    CreateCards()
        .environmentObject(DataManager())
}
