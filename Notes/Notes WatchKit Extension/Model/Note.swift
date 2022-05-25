//
//  Note.swift
//  Notes WatchKit Extension
//
//  Created by Camila Campana on 24/05/22.
//

import Foundation

struct Note: Identifiable, Codable {
    let id: UUID
    let text: String
}
