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
    @Published var sets: [Set] = []
    @Published var cards: [Card] = []
    @Published var setNames: [String] = []
    
    init() {
        fetchAdults()
        fetchChildren()
        fetchSets()
        fetchSetNames()
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
    
    func fetchSets() {
        sets.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("sets")
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print("DEBUG: Failed to fetch sets with error \(error!.localizedDescription)")
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let id = data["id"] as? String ?? ""
                    let name = data["name"] as? String ?? ""
                    let stat1 = data["stat1"] as? String ?? ""
                    let stat2 = data["stat2"] as? String ?? ""
                    let stat3 = data["stat3"] as? String ?? ""
                    let adult_id = data["adult_id"] as? String ?? ""
                    
                    let set = Set(id: id, name: name, stat1: stat1, stat2: stat2, stat3: stat3, adult_id: adult_id)
                    self.sets.append(set)
                }
            }
        }
    }
    
    func fetchSetNames() {
        setNames.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("sets")
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print("DEBUG: Failed to fetch sets with error \(error!.localizedDescription)")
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let name = data["name"] as? String ?? ""
                    self.setNames.append(name)
                }
            }
        }
    }
    
    func fetchCards() {
        cards.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("cards")
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print("DEBUG: Failed to fetch cards with error \(error!.localizedDescription)")
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let id = data["id"] as? String ?? ""
                    let set_id = data["set_id"] as? String ?? ""
                    let title = data["title"] as? String ?? ""
                   // let photo = data["photo"] as? Image ?? ""
                    let factfile = data["factfile"] as? String ?? ""
                    let value1 = data["value1"] as? String ?? ""
                    let value2 = data["value2"] as? String ?? ""
                    let value3 = data["value3"] as? String ?? ""
                    
                    let card = Card(id: id, set_id: set_id, title: title, photo: Image("logo_black"), factfile: factfile, value1: value1, value2: value2, value3: value3)
                    self.cards.append(card)
                }
            }
        }
    }
    
    func createSet(name: String, stat1: String, stat2: String, stat3: String, adult_id: String) {
        let db = Firestore.firestore()
        let ref = db.collection("sets")
        let uuid = UUID().uuidString
        //replace uuid with a way to get the unique document id out of firebase
        ref.addDocument(data: ["id": uuid, "name": name, "stat1": stat1, "stat2": stat2, "stat3": stat3, "adult_id": adult_id]) { error in
            if let error = error {
                print("DEBUG: failed to add set \(error.localizedDescription)")
            }
        }
    }
    
    func createCard(set_id: String, title: String, photo: Image, factfile: String, value1: String, value2: String, value3: String) {
        let db = Firestore.firestore()
        let ref = db.collection("cards")
        let uuid = UUID().uuidString
        //replace uuid with a way to get the unique document id out of firebase
        ref.addDocument(data: ["id": uuid, "set_id": set_id, "title": title, "photo": photo, "factfile": factfile, "value1": value1, "value2": value2, "value3": value3]) { error in
            if let error = error {
                print("DEBUG: failed to add card \(error.localizedDescription)")
            }
        }
    }
    
}
