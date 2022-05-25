//
//  ContentView.swift
//  Notes WatchKit Extension
//
//  Created by Camila Campana on 24/05/22.
//

import SwiftUI

struct ContentView: View {

    // MARK: - Properties

    @AppStorage("lineCount") var lineCount: Int = 1

    @State private var notes: [Note] = []
    @State private var text: String = ""

    // MARK: - Functions

    func getDocumentDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }

    func save() {
        do {
            // Convert the notes array in json
            let data = try JSONEncoder().encode(notes)

            // Create new URL to save a file
            let url = getDocumentDirectory().appendingPathComponent("notes")

            // Write the data to the given URL
            try data.write(to: url)
        } catch {
            print("Saving data has failed")
        }
    }

    func load() {
        DispatchQueue.main.async {
            do {
                // get the notes URL path
                let url = getDocumentDirectory().appendingPathComponent("notes")

                // create a new property for the data
                let data = try Data(contentsOf: url)

                // decode data
                notes = try JSONDecoder().decode([Note].self, from: data)
            } catch {
                print("Error")
            }
        }
    }

    func delete(offsets: IndexSet) {
        withAnimation {
            notes.remove(atOffsets: offsets)
            save()
        }
    }

    // MARK: - Body

    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 6) {
                TextField("Add New Note", text: $text)

                Button(action: {
                    // 1. Only run button action when text field is not empty
                    guard !text.isEmpty else { return }

                    // 2. Create a new note with text
                    let note = Note(id: UUID(), text: text)

                    // 3. Add the new note
                    notes.append(note)

                    // 4. Make text field empty
                    text = ""

                    // 5. Save the notes
                    save()
                }) {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 42, weight: .semibold))
                }
                .fixedSize()
                .buttonStyle(PlainButtonStyle())
                .foregroundColor(.accentColor)
            } //: HSTACK

            Spacer()

            if !notes.isEmpty {
                List {
                    ForEach(0..<notes.count, id: \.self) { i in
                        NavigationLink(
                            destination: DetailView(
                                note: notes[i],
                                count: notes.count,
                                index: i
                            )
                        ) {
                            HStack {
                                Capsule()
                                    .frame(width: 4)
                                    .foregroundColor(.accentColor)
                                Text(notes[i].text)
                                    .lineLimit(lineCount)
                                    .padding(.leading, 5)
                            } //: HSTACK
                        }
                    } //: LOOP
                    .onDelete(perform: delete)
                } //: LIST
            } else {
                Spacer()
                Image(systemName: "note.text")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
                    .opacity(0.25)
                    .padding(25)
                Spacer()
            }
        } //: VSTACK
        .navigationTitle("Notes")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            load()
        }
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
