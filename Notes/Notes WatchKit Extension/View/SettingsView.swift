//
//  SettingsView.swift
//  Notes WatchKit Extension
//
//  Created by Camila Campana on 24/05/22.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - Properties

    @AppStorage("lineCount") var lineCount: Int = 1

    @State private var sliderValue: Float = 1.0

    // MARK: - Function

    func update() {
        lineCount = Int(sliderValue)
    }

    // MARK: - Body

    var body: some View {
        VStack(spacing: 8) {
            // HEADER
            HeaderView(title: "Settings")

            // LINE COUNT
            Text("Lines \(lineCount)".uppercased())
                .fontWeight(.bold)

            // SLIDER
            Slider(value:
                    Binding(
                        get: {
                            self.sliderValue
                        },
                        set: { (newValue) in
                            self.sliderValue = newValue
                            self.update()
                        }
                    ),
                   in: 1...4,
                   step: 1
            ).accentColor(.accentColor)

        } //: VSTACK
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
