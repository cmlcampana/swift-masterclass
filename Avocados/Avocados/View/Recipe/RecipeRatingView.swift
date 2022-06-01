//
//  RecipeRatingView.swift
//  Avocados
//
//  Created by Camila Campana on 31/05/22.
//

import SwiftUI

struct RecipeRatingView: View {
    // MARK: - Properties
    let recipe: Recipe

    // MARK: - Body

    var body: some View {
        HStack {
            ForEach(1...recipe.rating, id: \.self) { _ in
                Image(systemName: "star.fill")
                    .font(.body)
                .foregroundColor(.yellow)
            }
        }
    }
}

struct RecipeRatingView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeRatingView(recipe: recipesData[0])
            .previewLayout(.fixed(width: 320, height: 60))
    }
}
