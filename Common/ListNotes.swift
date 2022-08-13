//
//  ListNotes.swift
//  NotesApp WatchKit Extension
//
//  Created by Kevin Menendez on 4/8/22.
//

import SwiftUI

struct ListNotes: View {
    var notes: [Note] = [Note(title: "Hey!"),
                         Note(title: "This is a note"),
                         Note(title: "Day to day")]
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
        }
    }
}

struct ListNotes_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ListNotes()
        }
    }
}
