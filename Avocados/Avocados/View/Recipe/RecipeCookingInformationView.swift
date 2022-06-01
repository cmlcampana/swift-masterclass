//
//  RecipeCookingInformationView.swift
//  Avocados
//
//  Created by Camila Campana on 31/05/22.
//

import SwiftUI

struct RecipeCookingInformationView: View {
    // MARK: - Properties

    let recipe: Recipe

    // MARK: - Body

    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            HStack(alignment: .center, spacing: 2) {
                Image(systemName: "person.2")
                Text("Serves: \(recipe.serves)")
            }

            HStack(alignment: .center, spacing: 2) {
                Image(systemName: "clock")
                Text("Prep: \(recipe.preparation)")
            }

            HStack(alignment: .center, spacing: 2) {
                Image(systemName: "flame")
                Text("Cooking: \(recipe.cooking)")
            }
        }
        .font(.footnote)
        .foregroundColor(.gray)
    }
}

struct RecipeCookingInformationView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCookingInformationView(recipe: recipesData[0])
            .previewLayout(.fixed(width: 320, height: 60))
    }
}
