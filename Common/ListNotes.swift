//
//  ListNotes.swift
//  NotesApp WatchKit Extension
//
//  Created by Kevin Menendez on 4/8/22.
//

import SwiftUI

struct ListNotes: View {
    @State var notes: [Note] = [Note]()
    var body: some View {
        List{
            ForEach(0..<notes.count, id: \.self) { i in
                NavigationLink(
                    destination: DetailNote(note: notes[i]),
                    label: {
                        Text(notes[i].title)
                            .lineLimit(1)
                    }
                )
            }
            .onDelete { indexSet in
                delete(offsets: indexSet)
            }
        }
        .onAppear {
            notes = load()
        }
    }
    
    func delete(offsets: IndexSet) {
        withAnimation {
            notes.remove(atOffsets: offsets)
        }
        StorageTools.shared.save(notes)
    }
    
    func load() -> [Note] {
        guard let notes = StorageTools.shared.load() else { return [] }
        return notes
    }
}

struct ListNotes_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ListNotes()
        }
    }
}
