//
//  HeadingView.swift
//  Africa
//
//  Created by Camila Campana on 16/05/22.
//

import SwiftUI

struct HeadingView: View {

    // MARK: - Properties
    let headingImage: String
    let headingText: String

    // MARK: - Body

    var body: some View {
        HStack {
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)

            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
        }
        .padding(.vertical)
    }
}

struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Picturers")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
