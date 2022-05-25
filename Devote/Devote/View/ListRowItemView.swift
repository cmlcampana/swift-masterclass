//
//  ListRowItemView.swift
//  Devote
//
//  Created by Camila Campana on 23/05/22.
//

import SwiftUI

struct ListRowItemView: View {
    // MARK: - Properties

    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject var item: Item

    // MARK: - Body

    var body: some View {
        Toggle(isOn: $item.completion) {
            Text(item.task ?? "")
                .font(.system(.title2, design: .rounded))
                .fontWeight(.heavy)
                .foregroundColor(item.completion ? .pink : .primary)
                .padding(.vertical, 12)
                .animation(.default, value: item.completion)
        } //: Toggle
        .toggleStyle(CheckBoxStyle())
        .onReceive(item.objectWillChange, perform: { _ in
            if viewContext.hasChanges {
                try? viewContext.save()
            }
        })
    }
}
