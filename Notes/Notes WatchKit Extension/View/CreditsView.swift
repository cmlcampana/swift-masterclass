//
//  CreditsView.swift
//  Notes WatchKit Extension
//
//  Created by Camila Campana on 24/05/22.
//

import SwiftUI

struct CreditsView: View {
    // MARK: - Properties

    @State private var randomNumber = Int.random(in: 1..<4)

    private var randomImage: String {
        "developer-no\(randomNumber)"
    }

    // MARK: - Body

    var body: some View {
        VStack(spacing: 3) {
            // PROFILE IMAGE
            Image(randomImage)
                .resizable()
                .scaledToFit()
                .layoutPriority(1)

            // HEADER
            HeaderView(title: "Credits")

            // CONTENT
            Text("Camila")
                .foregroundColor(.primary)
                .fontWeight(.bold)

            Text("Developer")
                .font(.footnote)
                .foregroundColor(.secondary)
                .fontWeight(.light)
        } //: VSTACK
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
