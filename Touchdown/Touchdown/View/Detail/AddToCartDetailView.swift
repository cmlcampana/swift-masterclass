//
//  AddToCartDetailView.swift
//  Touchdown
//
//  Created by Camila Campana on 18/05/22.
//

import SwiftUI

struct AddToCartDetailView: View {
    // MARK: - Properties

    @EnvironmentObject var shop: Shop

    // MARK: - Body

    var body: some View {
        Button(action: {

        }) {
            Spacer()
            Text("Add to cart".uppercased())
                .font(.system(.title2, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.white)
            Spacer()
        }
        .padding(15)
        .background(shop.selectedProduct?.computtedColor ?? sampleProduct.computtedColor)
        .clipShape(Capsule())
    }
}

struct AddToCartDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AddToCartDetailView()
            .environmentObject(Shop())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
