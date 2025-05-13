//
//  CharacterService.swift
//  MarvelDeck
//
//  Created by Megan Wiemer on 5/13/25.
//

import Foundation

protocol CharacterServiceProtocol {
    func fetchCharactersList() async throws -> [ComicCharacter]
}

struct CharacterService: CharacterServiceProtocol {
    private let apiClient: APISendable

    init(apiClient: APISendable = APIClient()) {
        self.apiClient = apiClient
    }

    func fetchCharactersList() async throws -> [ComicCharacter] {
        let response: CharacterResponse = try await apiClient.fetch(CharacterEndpoint.characters)
        return response.data.results
    }
}
