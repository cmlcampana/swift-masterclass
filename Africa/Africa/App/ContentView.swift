//
//  ContentView.swift
//  Africa
//
//  Created by Camila Campana on 13/05/22.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties

    private let animals: [Animal] = Bundle.main.decode("animals.json")
    private let haptics = UIImpactFeedbackGenerator(style: .medium)

    @State private var gridLayout: [GridItem] = [ GridItem(.flexible()) ]
    @State private var gridColumn = 1
    @State private var toolbarIcon = "square.grid.2x2"

    @State private var isGridActive = false

    // MARK: - Functions

    func gridSwich() {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count

        // Toolbar image
        switch gridColumn {
        case 1:
            toolbarIcon = "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }
    }

    // MARK: - Body

    var body: some View {
        NavigationView {
            Group {
                if !isGridActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))

                        ForEach(animals) { animal in
                            NavigationLink(destination: AnimaDetailView(animal: animal)) {
                                AnimalListItemView(animal: animal)
                            }
                        }

                        CreditsView()
                            .modifier(CenterModifier())
                    } //: List
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimaDetailView(animal: animal)) {
                                    AnimalGridItemView(animal: animal)
                                }
                            } //: Loop
                        } //: Grid
                        .padding(10)
                        .animation(.easeIn, value: gridLayout)
                    } //: SCROLL
                } //: Conditional
            } //: Group
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {

                        // LIST
                        Button(action: {
                            isGridActive = false
                            haptics.impactOccurred()
                        }) {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridActive ? .primary : .accentColor)
                        }

                        // GRID
                        Button(action: {
                            isGridActive = true
                            haptics.impactOccurred()
                            gridSwich()
                        }) {
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundColor(isGridActive ? .accentColor : .primary)
                        }

                    } //: HStack
                } //: Toolbar item
            }//: Toolbar

        } //: Navigation
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
