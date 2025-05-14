//
//  CharacterListViewModel.swift
//  MarvelDeck
//
//  Created by Megan Wiemer on 5/13/25.
//

import SwiftUI

class CharacterListViewModel: ObservableObject {
    @Published var characters = [ComicCharacter]()
    @Published var isLoading = false

    private let characterService: CharacterServiceProtocol

    init(characterService: CharacterServiceProtocol = CharacterService()) {
        self.characterService = characterService
    }

    func loadCharacterList(_ offset: Int = 0) {
        Task { @MainActor in
            do {
                isLoading = true
                let results = try await characterService.fetchCharactersList(offset: offset)
                characters.append(contentsOf: results)
                isLoading = false
            } catch {
                print("!!!! Make sure to handle the error !!!!")
                print(error.localizedDescription)
                isLoading = false
            }
        }
    }

    func fetchMoreCharactersIfNeeded(_ currentItem: ComicCharacter) {
        guard characters.last == currentItem else {
            return
        }

        loadCharacterList(characters.count)
    }
}
