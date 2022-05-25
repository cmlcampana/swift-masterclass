//
//  Shop.swift
//  Touchdown
//
//  Created by Camila Campana on 18/05/22.
//

import Foundation

final class Shop: ObservableObject {
    @Published var showingProduct: Bool = false
    @Published var selectedProduct: Product? = nil
}
