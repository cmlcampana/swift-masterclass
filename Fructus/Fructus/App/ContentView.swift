//
//  ContentView.swift
//  Fructus
//
//  Created by Camila Campana on 11/05/22.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties

    private let fruits: [Fruit] = fruitsData

    @State private var isShowingSettings: Bool = false

    // MARK: - Body

    var body: some View {
        NavigationView {
            List {
                ForEach(fruits.sorted(by: {
                    $0.title.compare($1.title) == .orderedAscending
                })) { item in
                    NavigationLink(destination: FruitDetailView(fruit: item)) {
                        FruitRowView(fruit: item)
                            .padding(.vertical, 4)
                    }
                }
            }
            .navigationTitle("Fruits")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isShowingSettings = true
                    }) {
                        Image(systemName: "slider.horizontal.3")
                    }
                    .sheet(isPresented: $isShowingSettings) {
                        SettingsView()
                    }
                }
            }
        } //: NAVIGATION
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
