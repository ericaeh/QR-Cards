//
//  child.swift
//  QR Cards
//
//  Created by Erica Heiermann on 03/02/2026.
//

import Foundation

struct Child: Identifiable, Codable {
    let id: String
    let username: String
    let email: String
    let associatedAdult: String
}
