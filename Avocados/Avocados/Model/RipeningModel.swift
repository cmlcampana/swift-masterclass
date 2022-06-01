//
//  RipeningModel.swift
//  Avocados
//
//  Created by Camila Campana on 31/05/22.
//

import SwiftUI

// MARK: - Ripening Model

struct Ripening: Identifiable {
    var id = UUID()
    let image: String
    let stage: String
    let title: String
    let description: String
    let ripeness: String
    let instruction: String
}
