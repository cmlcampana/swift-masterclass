//
//  SettingsLabelView.swift
//  Fructus
//
//  Created by Camila Campana on 12/05/22.
//

import SwiftUI

struct SettingsLabelView: View {
    // MARK: - Properties

    let labelText: String
    let labelImage: String

    // MARK: Body

    var body: some View {
        HStack {
            Text(labelText.uppercased())
                .fontWeight(.bold)
            Spacer()
            Image(systemName: labelImage)
        }
    }
}

// MARK: - Preview

struct SettingsLabelView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsLabelView(labelText: "Fructus", labelImage: "info.circle")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
