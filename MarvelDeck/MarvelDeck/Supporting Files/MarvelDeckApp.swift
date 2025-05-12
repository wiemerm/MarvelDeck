//
//  MarvelDeckApp.swift
//  MarvelDeck
//
//  Created by Megan Wiemer on 5/11/25.
//

import SwiftUI

@main
struct MarvelDeckApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ComicCharacterEnvironmentKey: EnvironmentKey {
    nonisolated(unsafe) static var defaultValue: ComicCharacter? = nil
}

extension EnvironmentValues {
    var comicCharacter: ComicCharacter? {
        get { self[ComicCharacterEnvironmentKey.self] }
        set { self[ComicCharacterEnvironmentKey.self] = newValue }
    }
}
