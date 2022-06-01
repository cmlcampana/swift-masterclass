//
//  FactModel.swift
//  Avocados
//
//  Created by Camila Campana on 31/05/22.
//

import SwiftUI

// MARK: - Fact Model

struct Fact: Identifiable {
    var id = UUID()
    let image: String
    let content: String
}
