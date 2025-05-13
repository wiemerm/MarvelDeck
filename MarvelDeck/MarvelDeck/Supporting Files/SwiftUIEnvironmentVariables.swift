//
//  SwiftUIEnvironmentVariables.swift
//  MarvelDeck
//
//  Created by Megan Wiemer on 5/13/25.
//

import SwiftUI

struct ComicCharacterEnvironmentKey: EnvironmentKey {
    static var defaultValue: String? = nil
}

extension EnvironmentValues {
    var comicCharacter: String? {
        get { self[ComicCharacterEnvironmentKey.self] }
        set { self[ComicCharacterEnvironmentKey.self] = newValue }
    }
}
