//
//  ContentView.swift
//  Touchdown
//
//  Created by Camila Campana on 18/05/22.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties

    @EnvironmentObject var shop: Shop

    // MARK: - Body

    var body: some View {
        ZStack {
            if !shop.showingProduct && shop.selectedProduct == nil {
                VStack(spacing: 0) {
                    NavigationBarView()
                        .padding(.horizontal, 15)
                        .padding(.bottom)
                        .padding(.top, UIApplication
                                            .shared
                                            .connectedScenes
                                            .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
                                            .first { $0.isKeyWindow }?.safeAreaInsets.top
                        )
                        .background(.white)
                        .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 5)

                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 0) {
                            FeaturedTabView()
                                .frame(minHeight: 256)
                                .padding(.vertical, 20)

                            CategoryGridView()

                            TitleView(title: "Helmets")

                            LazyVGrid(columns: gridLayout, spacing: 15) {
                                ForEach(products) { product in
                                    ProductItemView(product: product)
                                        .onTapGesture {
                                            withAnimation(.easeOut) {
                                                shop.selectedProduct = product
                                                shop.showingProduct = true
                                            }
                                        }
                                }
                            }
                            .padding(15)

                            TitleView(title: "Brands")

                            BrandGridView()

                            FooterView()
                                .padding(.horizontal)
                        } //: Vstack
                    } //: Scroll
                } //: Vstack
                .background(
                    colorBackground.ignoresSafeArea(.all, edges: .all)
            )
            } else {
                DetailView()
            }
        }// : ZStack
        .ignoresSafeArea(.all, edges: .all)
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Shop())
    }
}
