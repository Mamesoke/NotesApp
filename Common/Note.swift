//
//  Note.swift
//  NotesApp WatchKit Extension
//
//  Created by Kevin Menendez on 4/8/22.
//

import SwiftUI

struct Note: Identifiable {
    var id: UUID
    
    var title: String
    var creationDate: String // TODO: Convert to Date
    
    init(title: String) {
        id = UUID()
        self.title = title
        creationDate = Date.today()
    }
}
