//
//  AddNote.swift
//  NotesApp WatchKit Extension
//
//  Created by Kevin Menendez on 4/8/22.
//

import SwiftUI

struct AddNote: View {
    @State private var notes = [Note]()
    @State private var text = ""
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack{
            TextField("nota", text: $text)
            Button("Agregar nota"){
                guard !text.isEmpty else { return }
                let note = Note(title: text)
                notes.append(note)
                StorageTools.shared.save(notes)
                text = ""
                presentation.wrappedValue.dismiss()
            }
        }.onAppear {
            notes = load()
        }
    }
    
    func load() -> [Note] {
        guard let notes = StorageTools.shared.load() else { return [] }
        return notes
    }
    
}

struct AddNote_Previews: PreviewProvider {
    static var previews: some View {
        AddNote()
    }
}
