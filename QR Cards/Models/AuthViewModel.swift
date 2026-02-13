//
//  AuthViewModel.swift
//  QR Cards
//
//  Created by Erica Heiermann on 01/02/2026.
//

import Foundation
import Firebase
import FirebaseAuth
internal import Combine
import FirebaseFirestore

protocol AuthenticationFormProtocol {
    var formIsValid: Bool { get }
}

@MainActor

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        Task {
            await fetchUser()
        }
    }
    
    func signIn(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
        } catch {
            print("DEBUG: Failed to log in with error \(error.localizedDescription)")
        }
    }
//original create user
    
//    func createUser(withEmail email: String, password: String, username: String, accountType: String, associatedAdult: String) async throws {
//        do {
//            let result = try await Auth.auth().createUser(withEmail: email, password: password)
//            self.userSession = result.user
//            let user = User(id: result.user.uid, username: username, email: email, accountType: accountType, associatedAdult: associatedAdult)
//            let encodedUser = try Firestore.Encoder().encode(user)
//            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
//            await fetchUser()
//        } catch {
//            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
//        }
//    }
    
    
    func createAdult(withEmail email: String, password: String, username: String) async throws {
        do {
            //creating the user in firebase
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            //creating a user for the database that just has an id to enable currentUser to work
            let user = User(id: result.user.uid, accountType: "Adult")
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser()
            //creating the adult for the database
            let adult = Adult(id: result.user.uid, username: username, email: email)
            let encodedAdult = try Firestore.Encoder().encode(adult)
            try await Firestore.firestore().collection("adults").document(adult.id).setData(encodedAdult)
            await fetchAdult()
        }
    }
    
    func createChild(withEmail email: String, password: String, username: String, associatedAdult: String) async throws {
        do {
            //creating the user in firebase
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            //creating a user for the database that just has an id to enable currentUser to work
            let user = User(id: result.user.uid, accountType: "Child")
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser()
            //creating the adult for the database
            let child = Child(id: result.user.uid, username: username, email: email, associatedAdult: associatedAdult)
            let encodedChild = try Firestore.Encoder().encode(child)
            try await Firestore.firestore().collection("children").document(child.id).setData(encodedChild)
            await fetchChild()
        }
    }
    
//    func createSet(name: String, stat1: String, stat2: String, stat3: String, adult_id: String) {
//        let set = Set(id: NSUUID().uuidString, name: name, stat1: stat1, stat2: stat2, stat3: stat3, adult_id: adult_id)
//    }
    
    func signOut() {
        do {
            try Auth.auth().signOut() // signs out user on backend
            self.userSession = nil // ends user session
            self.currentUser = nil // makes content view update to show home page
        } catch {
            print("DEBUG: Failed to sign out with error \(error.localizedDescription)")
        }
    }
    
    func deleteAccount() {
        
    }
    
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }
        self.currentUser = try? snapshot.data(as: User.self)
        
        print("DEBUG: Current user is \(self.currentUser)")
    }
    
    func fetchAdult() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let snapshot = try? await Firestore.firestore().collection("adults").document(uid).getDocument() else { return }
        
        print("DEBUG: Current user is \(self.currentUser)")
    }
    
    func fetchChild() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let snapshot = try? await Firestore.firestore().collection("children").document(uid).getDocument() else { return }
        
        print("DEBUG: Current user is \(self.currentUser)")
    }
    
    

}
