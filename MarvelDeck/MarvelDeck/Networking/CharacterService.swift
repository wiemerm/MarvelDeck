//
//  CharacterService.swift
//  MarvelDeck
//
//  Created by Megan Wiemer on 5/13/25.
//

import Foundation

protocol CharacterServiceProtocol {
    func fetchCharactersList(offset: Int) async throws -> [ComicCharacter]
    func fetchComics(for characterID: Int, offset: Int) async throws -> ComicData
    func fetchEvents(for characterID: Int, offset: Int) async throws -> ComicData
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

    func fetchComics(for characterID: Int, offset: Int) async throws -> ComicData {
        let response: ComicResponse = try await apiClient.fetch(CharacterEndpoint.comics(characterID: characterID, offset: offset))
        return response.data
    }

    func fetchEvents(for characterID: Int, offset: Int) async throws -> ComicData {
        let response: ComicResponse = try await apiClient.fetch(CharacterEndpoint.events(characterID: characterID, offset: offset))
        return response.data
    }
}
