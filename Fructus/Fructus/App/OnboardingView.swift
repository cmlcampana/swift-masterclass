//
//  OnboardingView.swift
//  Fructus
//
//  Created by Camila Campana on 11/05/22.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: PROPERTIES

    private let fruits: [Fruit] = fruitsData

    // MARK: BODY

    var body: some View {
        TabView {
            ForEach(fruits[0...5]) { item in
                FruitCardView(fruit: item)
            }
        } //: TAB
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical, 20)
    }
}

// MARK: - PREVIEW

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
