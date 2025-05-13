//
//  CharacterListViewModel.swift
//  MarvelDeck
//
//  Created by Megan Wiemer on 5/13/25.
//

import SwiftUI

class CharacterListViewModel: ObservableObject {
    @Published var characters = [ComicCharacter]()

    private let characterService: CharacterServiceProtocol

    init(characterService: CharacterServiceProtocol = CharacterService()) {
        self.characterService = characterService
    }

    func loadCharacterList() {
        Task { @MainActor in
            do {
                characters = try await characterService.fetchCharactersList()
            } catch {
                print("!!!! Make sure to handle the error !!!!")
                print(error.localizedDescription)
            }
        }
    }
}
