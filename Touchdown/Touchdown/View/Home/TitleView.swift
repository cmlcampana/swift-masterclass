//
//  TitleView.swift
//  Touchdown
//
//  Created by Camila Campana on 18/05/22.
//

import SwiftUI

struct TitleView: View {
    // MARK: - Properties
    var title: String

    // MARK: - Body
    var body: some View {
        HStack {
            Text(title)
            .font(.largeTitle)
            .fontWeight(.heavy)
            Spacer()
        } //: HStack
        .padding(.horizontal)
        .padding(.top, 15)
        .padding(.bottom, 10)
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(title: "Helmet")
            .previewLayout(.sizeThatFits)
            .padding()
            .background(colorBackground)
    }
}
