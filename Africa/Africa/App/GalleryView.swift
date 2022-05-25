//
//  GalleryView.swift
//  Africa
//
//  Created by Camila Campana on 13/05/22.
//

import SwiftUI

// workaround to animate slider
extension GridItem: Equatable {
    public static func == (lhs: GridItem, rhs: GridItem) -> Bool {
        lhs.alignment == rhs.alignment &&
        lhs.spacing == lhs.spacing
    }
}

struct GalleryView: View {
    // MARK: - Properties

    @State private var selectedAnimal: String = "lion"
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)

    // Simple GRID
//    let gridLayout: [GridItem] = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible())
//    ]

    // Efficient grid
//    let gridLayout: [GridItem] = Array(
//        repeating: GridItem(.flexible()),
//        count: 3
//    )

    // Dynamic grid

    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0

    // MARK: - Functions

    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }

    // MARK: - Body

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 30) {
                // MARK: - Image

                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 8)
                    )

                // MARK: - Slider

                Slider(value: $gridColumn, in: 2...4, step: 1) { _ in
                    gridSwitch()
                }
                .padding(.horizontal)

                // MARK: - GRID

                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { animal in
                        Image(animal.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(
                                Circle().stroke(Color.white, lineWidth: 1)
                            )
                            .onTapGesture {
                                selectedAnimal = animal.image
                                haptics.impactOccurred()
                            }
                    }
                } //: LazyVGrid
                .animation(.easeIn, value: gridLayout)
                .onAppear(perform: {
                    gridSwitch()
                })
            } //: VStack
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        } //: Scroll
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            MotionAnimationView()
        )
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
