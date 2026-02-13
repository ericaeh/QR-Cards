//
//  card.swift
//  QR Cards
//
//  Created by Erica Heiermann on 07/02/2026.
//

import Foundation
import SwiftUI

struct Card: Identifiable {
    let id: String
    let set_id: String
    let title: String
    let photo: Image
    let factfile: String
    let value1: String
    let value2: String
    let value3: String
}
