//
//  DataManager.swift
//  QR Cards
//
//  Created by Erica Heiermann on 04/02/2026.
//
//from logans video, could possibly move into authviewmodel

import SwiftUI
import Firebase
internal import Combine

class DataManager: ObservableObject {
    @Published var adults: [Adult] = []
    @Published var children: [Child] = []
    
    init() {
        fetchAdults()
        fetchChildren()
    }
    
    func fetchAdults() {
        adults.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("adults")
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print("DEBUG: Failed to fetch adults with error \(error!.localizedDescription)")
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let id = data["id"] as? String ?? ""
                    let username = data["username"] as? String ?? ""
                    let email = data["email"] as? String ?? ""
                    
                    let adult = Adult(id: id, username: username, email: email)
                    self.adults.append(adult)
                }
            }
        }
    }
    
    func fetchChildren() {
        children.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("children")
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print("DEBUG: Failed to fetch children with error \(error!.localizedDescription)")
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let id = data["id"] as? String ?? ""
                    let username = data["username"] as? String ?? ""
                    let email = data["email"] as? String ?? ""
                    let associatedAdult = data["associatedAdult"] as? String ?? ""
                    
                    let child = Child(id: id, username: username, email: email, associatedAdult: associatedAdult)
                    self.children.append(child)
                }
            }
        }
    }
}
