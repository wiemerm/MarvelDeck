//
//  CharactersEndpointTests.swift
//  MarvelDeckTests
//
//  Created by Megan Wiemer on 5/11/25.
//

import Foundation
import Testing
@testable import MarvelDeck

struct CharactersEndpointTests {
    @Test func charactersEndpoint() async throws {
        let endpoint = CharactersEndpoint.characters
        let queryItemNames = endpoint.queryItems.compactMap { $0.name }
        #expect(endpoint.scheme == "https")
        #expect(endpoint.baseUrl == EnvironmentVariables.baseURL)
        #expect(endpoint.path == "/v1/public/characters")
        #expect(endpoint.queryItems.count == 3)
        #expect(queryItemNames.contains("ts"))
        #expect(queryItemNames.contains("apikey"))
        #expect(queryItemNames.contains("hash"))
        #expect(endpoint.makeRequest() != nil)
    }

    @Test func individualCharacterEndpoint() async throws {
        let characterID = UUID().hashValue
        let endpoint = CharactersEndpoint.character(id: characterID)
        let queryItemNames = endpoint.queryItems.compactMap { $0.name }
        #expect(endpoint.scheme == "https")
        #expect(endpoint.baseUrl == EnvironmentVariables.baseURL)
        #expect(endpoint.path == "/v1/public/characters/\(characterID)")
        #expect(endpoint.queryItems.count == 3)
        #expect(queryItemNames.contains("ts"))
        #expect(queryItemNames.contains("apikey"))
        #expect(queryItemNames.contains("hash"))
        #expect(endpoint.makeRequest() != nil)
    }

    @Test func comicsContainingCharacterEndpoint() async throws {
        let characterID = UUID().hashValue
        let endpoint = CharactersEndpoint.comics(characterID: characterID)
        let queryItemNames = endpoint.queryItems.compactMap { $0.name }
        #expect(endpoint.scheme == "https")
        #expect(endpoint.baseUrl == EnvironmentVariables.baseURL)
        #expect(endpoint.path == "/v1/public/characters/\(characterID)/comics")
        #expect(endpoint.queryItems.count == 3)
        #expect(queryItemNames.contains("ts"))
        #expect(queryItemNames.contains("apikey"))
        #expect(queryItemNames.contains("hash"))
        #expect(endpoint.makeRequest() != nil)
    }

    @Test func eventsByCharacterEndpoint() async throws {
        let characterID = UUID().hashValue
        let endpoint = CharactersEndpoint.events(characterID: characterID)
        let queryItemNames = endpoint.queryItems.compactMap { $0.name }
        #expect(endpoint.scheme == "https")
        #expect(endpoint.baseUrl == EnvironmentVariables.baseURL)
        #expect(endpoint.path == "/v1/public/characters/\(characterID)/events")
        #expect(endpoint.queryItems.count == 3)
        #expect(queryItemNames.contains("ts"))
        #expect(queryItemNames.contains("apikey"))
        #expect(queryItemNames.contains("hash"))
        #expect(endpoint.makeRequest() != nil)
    }
}
