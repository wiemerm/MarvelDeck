//
//  CharacterDetailViewModel.swift
//  MarvelDeck
//
//  Created by Megan Wiemer on 5/13/25.
//

import SwiftUI

@Observable
class CharacterDetailViewModel {
    var imageURLs = [URL]()

    let character: ComicCharacter

    init(character: ComicCharacter) {
        self.character = character
    }

    func loadComics() async {
        
    }

    func loadEvents() async {

    }
}
