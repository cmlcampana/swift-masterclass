//
//  SettingsRowView.swift
//  Fructus
//
//  Created by Camila Campana on 12/05/22.
//

import SwiftUI

struct SettingsRowView: View {

    // MARK: - Properties

    let name: String
    var content: String? = nil
    var linkLabel: String? = nil
    var linkDestination: String? = nil

    // MARK: - Body

    var body: some View {
        VStack {
            Divider().padding(.vertical, 4)

            HStack {
                Text(name).foregroundColor(.gray)

                Spacer()

                if let content = content {
                    Text(content)
                } else if let linkLabel = linkLabel, let linkDestination = linkDestination {
                    Link(linkLabel, destination: URL(string: "https://\(linkDestination)")!)
                    Image(systemName: "arrow.up.right.square")
                        .foregroundColor(.pink)
                } else {
                    EmptyView()
                }
            }
        }
    }
}

// MARK: - Preview

struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SettingsRowView(name: "Developer", content: "Camila")
                .preferredColorScheme(.light)
                .previewLayout(.fixed(width: 375, height: 60))
            .padding()
            SettingsRowView(
                name: "Website",
                linkLabel: "SwiftUI Masterclass",
                linkDestination: ""
            )
                .preferredColorScheme(.dark)
                .previewLayout(.fixed(width: 375, height: 60))
                .padding()
        }
    }
}
