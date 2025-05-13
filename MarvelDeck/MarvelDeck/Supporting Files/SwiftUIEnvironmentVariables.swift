//
//  SwiftUIEnvironmentVariables.swift
//  MarvelDeck
//
//  Created by Megan Wiemer on 5/13/25.
//

import SwiftUI

struct ComicCharacterEnvironmentKey: EnvironmentKey {
    static var defaultValue: ComicCharacter? = nil
}

extension EnvironmentValues {
    var comicCharacter: ComicCharacter? {
        get { self[ComicCharacterEnvironmentKey.self] }
        set { self[ComicCharacterEnvironmentKey.self] = newValue }
    }
}
