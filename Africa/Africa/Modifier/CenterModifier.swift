//
//  CenterModifier.swift
//  Africa
//
//  Created by Camila Campana on 17/05/22.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
