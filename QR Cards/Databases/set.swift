//
//  set.swift
//  QR Cards
//
//  Created by Erica Heiermann on 07/02/2026.
//

import Foundation

struct Set: Identifiable, Codable, Hashable {
    let id: String
    let name: String
    let stat1: String
    let stat2: String
    let stat3: String
    let adult_id: String
}
