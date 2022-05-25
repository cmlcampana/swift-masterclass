//
//  CoverImageView.swift
//  Africa
//
//  Created by Camila Campana on 13/05/22.
//

import SwiftUI

struct CoverImageView: View {
    // MARK: - Properties

    private let coverImages: [CoverImage] = Bundle.main.decode("covers.json")

    // MARK: - Body

    var body: some View {
        TabView {
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            } //: LOOP
        } //: TAB
        .tabViewStyle(PageTabViewStyle())
    }
}

// MARK: - Preview

struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
