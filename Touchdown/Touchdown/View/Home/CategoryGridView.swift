//
//  CategoryGridView.swift
//  Touchdown
//
//  Created by Camila Campana on 18/05/22.
//

import SwiftUI

struct CategoryGridView: View {
    // MARK: - Properties

    // MARK: - Body

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: gridLayout, alignment: .center, spacing: columnSpacing, pinnedViews: []) {
                Section(
                    content: {
                        ForEach(categories) { category in
                            CategoryItemView(category: category)
                        }
                    },
                    header: {
                        SectionView(rotateClockwise: false)
                    },
                    footer: {
                        SectionView(rotateClockwise: true)
                    }
                )

            } // Grid
            .frame(height: 140)
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
        } //: Scroll
    }
}

struct CategoryGridView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryGridView()
            .previewLayout(.sizeThatFits)
            .padding()
            .background(colorBackground)
    }
}
