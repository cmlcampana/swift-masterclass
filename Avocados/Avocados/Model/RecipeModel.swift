//
//  RecipeModel.swift
//  Avocados
//
//  Created by Camila Campana on 31/05/22.
//

import SwiftUI

// MARK: - Recipe Model

struct Recipe: Identifiable {
    var id = UUID()
    let title: String
    let headline: String
    let image: String
    let rating: Int
    let serves: Int
    let preparation: Int
    let cooking: Int
    let instructions: [String]
    let ingredients: [String]
}
