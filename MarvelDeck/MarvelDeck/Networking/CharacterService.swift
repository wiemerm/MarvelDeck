//
//  CharacterService.swift
//  MarvelDeck
//
//  Created by Megan Wiemer on 5/13/25.
//

import Foundation

protocol CharacterServiceProtocol {
    func fetchCharactersList(offset: Int) async throws -> [ComicCharacter]
    func fetchComics(for characterID: Int) async throws -> [Comic]
    func fetchEvents(for characterID: Int) async throws -> [Comic]
}

struct CharacterService: CharacterServiceProtocol {
    private let apiClient: APISendable

    init(apiClient: APISendable = APIClient()) {
        self.apiClient = apiClient
    }

    func fetchCharactersList(offset: Int) async throws -> [ComicCharacter] {
        let response: CharacterResponse = try await apiClient.fetch(CharacterEndpoint.characters(offset: offset))
        return response.data.results
    }

    func fetchComics(for characterID: Int) async throws -> [Comic] {
        let response: ComicResponse = try await apiClient.fetch(CharacterEndpoint.comics(characterID: characterID))
        return response.data.results
    }

    func fetchEvents(for characterID: Int) async throws -> [Comic] {
        let response: ComicResponse = try await apiClient.fetch(CharacterEndpoint.events(characterID: characterID))
        return response.data.results
    }
}
