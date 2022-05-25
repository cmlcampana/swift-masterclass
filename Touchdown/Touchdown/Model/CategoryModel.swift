//
//  CategoryModel.swift
//  Touchdown
//
//  Created by Camila Campana on 18/05/22.
//

import Foundation

struct Category: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
}
