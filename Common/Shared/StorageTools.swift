//
//  StorageTools.swift
//  NotesApp WatchKit Extension
//
//  Created by Kevin Menendez on 14/8/22.
//

import Foundation

class StorageTools {
    let key: String = "NotesApp"
    static let shared = StorageTools()
    
    private init(){}
    
    func save(_ dataNotes: [Note]) {
        let data = dataNotes.map{ try? JSONEncoder().encode($0) }
        UserDefaults.standard.setValue(data, forKey: key)
    }

    func load() -> [Note]? {
        guard let savedData = UserDefaults.standard.array(forKey: key) as? [Data] else {
            return nil
        }
        return savedData.compactMap({ try? JSONDecoder().decode(Note.self, from: $0 )})
    }
}
