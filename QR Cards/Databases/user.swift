//
//  user.swift
//  QR Cards
//
//  Created by Erica Heiermann on 01/02/2026.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
//    let username: String
//    let email: String
    let accountType: String
//    let associatedAdult: String
//    
//    var initials: String {
//        let formatter = PersonNameComponentsFormatter()
//        if let components = formatter.personNameComponents(from: username) {
//            formatter.style = .abbreviated
//            return formatter.string(from: components)
//        }
//        
//        return ""
//    }
}


extension User {
    static var MOCK_USER = User(id: NSUUID().uuidString, accountType: "Adult")
//    static var MOCK_USER = User(id: NSUUID().uuidString, username: "Erica Heiermann", email: "test@gmail.com", accountType: "Adult", associatedAdult: "")
}
