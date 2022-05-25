//
//  ProductModel.swift
//  Touchdown
//
//  Created by Camila Campana on 18/05/22.
//

import SwiftUI

struct MyColor: Codable {
    let red: Double
    let green: Double
    let blue: Double
}

struct Product: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
    let price: Int
    let description: String
    let color: MyColor

    var computtedColor: Color {
        Color(red: color.red, green: color.green, blue: color.blue)
    }

    var formmatedPrice: String {
        "$\(price)"
    }
}
