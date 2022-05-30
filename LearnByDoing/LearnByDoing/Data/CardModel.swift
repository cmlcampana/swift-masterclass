//
//  CardModel.swift
//  LearnByDoing
//
//  Created by Camila Campana on 30/05/22.
//

import SwiftUI

// MARK: - Card Model

struct Card: Identifiable {
    var id = UUID()
    let title: String
    let headline: String
    let imageName: String
    let callToAction: String
    let message: String
    let gradientColors: [Color]
}
