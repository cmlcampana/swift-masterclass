//
//  HeaderModel.swift
//  Avocados
//
//  Created by Camila Campana on 30/05/22.
//

import SwiftUI

// MARK: - Header Model

struct Header: Identifiable {
    var id = UUID()
    let image: String
    let headline: String
    let subheadline: String
}
