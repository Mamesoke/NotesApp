//
//  ContentView.swift
//  NotesApp WatchKit Extension
//
//  Created by Kevin Menendez on 4/8/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            NavigationLink("Agregar nota", destination: AddNote())
            NavigationLink("Listar notas", destination: ListNotes())
        }.navigationTitle("Notes App")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
