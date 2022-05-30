//
//  ContentView.swift
//  LearnByDoing
//
//  Created by Camila Campana on 30/05/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 20) {
                ForEach(cardData) { card in
                    CardView(card: card)
                }
            }
            .padding(20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
        }
    }
}
