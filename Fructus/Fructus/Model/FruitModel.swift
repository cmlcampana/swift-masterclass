//
//  FruitModel.swift
//  Fructus
//
//  Created by Camila Campana on 11/05/22.
//

import SwiftUI

// MARK: - Fruits Data Model

struct Fruit: Identifiable {
    let id = UUID()
    let title: String
    let headline: String
    let image: String
    let gradientColors: [Color]
    let description: String
    let nutrition: [String]
}
