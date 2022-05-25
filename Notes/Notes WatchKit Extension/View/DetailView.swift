//
//  DetailView.swift
//  Notes WatchKit Extension
//
//  Created by Camila Campana on 24/05/22.
//

import SwiftUI

struct DetailView: View {
    // MARK: - Properties

    let note: Note
    let count: Int
    let index: Int

    @State private var isCreditsPresented = false
    @State private var isSettingsPresented = false

    // MARK: - Body

    var body: some View {
        VStack(alignment: .center, spacing: 3) {
            // HEADER
            HeaderView()

            // CONTENT
            Spacer()

            ScrollView(.vertical) {
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            }

            Spacer()

            // FOOTER

            HStack(alignment: .center) {
                Image(systemName: "gear")
                    .imageScale(.large)
                    .onTapGesture {
                        isSettingsPresented.toggle()
                    }
                    .sheet(isPresented: $isSettingsPresented, content: {
                        SettingsView()
                    })

                Spacer()

                Text("\(index + 1)/\(count)")

                Spacer()

                Image(systemName: "info.circle")
                    .imageScale(.large)
                    .onTapGesture {
                        isCreditsPresented.toggle()
                    }
                    .sheet(isPresented: $isCreditsPresented, content: {
                        CreditsView()
                    })
            } //: HSTACK
            .foregroundColor(.secondary)

        } //: VSTACK
        .padding(3)
    }
}

// MARK: - Preview

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(note: Note(id: UUID(), text: "My Note"), count: 1, index: 1)
    }
}
