//
//  CharacterEndpointTests.swift
//  MarvelDeckTests
//
//  Created by Megan Wiemer on 5/11/25.
//

import Foundation
import XCTest
@testable import MarvelDeck

final class CharacterEndpointTests: XCTestCase {
    func test_charactersEndpoint() async throws {
        let endpoint = CharacterEndpoint.characters(offset: 0)
        let queryItemNames = endpoint.queryItems.compactMap { $0.name }
        XCTAssertEqual(endpoint.scheme, "https")
        XCTAssertEqual(endpoint.baseURL, EnvironmentVariables.baseURL)
        XCTAssertEqual(endpoint.path, "/v1/public/characters")
        XCTAssertEqual(endpoint.queryItems.count, 4)
        XCTAssertTrue(queryItemNames.contains("ts"))
        XCTAssertTrue(queryItemNames.contains("apikey"))
        XCTAssertTrue(queryItemNames.contains("hash"))
        XCTAssertTrue(endpoint.makeRequest() != nil)
    }

    func test_individualCharacterEndpoint() async throws {
        let characterID = UUID().hashValue
        let endpoint = CharacterEndpoint.character(id: characterID)
        let queryItemNames = endpoint.queryItems.compactMap { $0.name }
        XCTAssertEqual(endpoint.scheme , "https")
        XCTAssertEqual(endpoint.baseURL , EnvironmentVariables.baseURL)
        XCTAssertEqual(endpoint.path , "/v1/public/characters/\(characterID)")
        XCTAssertEqual(endpoint.queryItems.count , 3)
        XCTAssertTrue(queryItemNames.contains("ts"))
        XCTAssertTrue(queryItemNames.contains("apikey"))
        XCTAssertTrue(queryItemNames.contains("hash"))
        XCTAssertTrue(endpoint.makeRequest() != nil)
    }

    func test_comicsContainingCharacterEndpoint() async throws {
        let characterID = UUID().hashValue
        let endpoint = CharacterEndpoint.comics(characterID: characterID)
        let queryItemNames = endpoint.queryItems.compactMap { $0.name }
        XCTAssertEqual(endpoint.scheme , "https")
        XCTAssertEqual(endpoint.baseURL , EnvironmentVariables.baseURL)
        XCTAssertEqual(endpoint.path , "/v1/public/characters/\(characterID)/comics")
        XCTAssertEqual(endpoint.queryItems.count , 3)
        XCTAssertTrue(queryItemNames.contains("ts"))
        XCTAssertTrue(queryItemNames.contains("apikey"))
        XCTAssertTrue(queryItemNames.contains("hash"))
        XCTAssertTrue(endpoint.makeRequest() != nil)
    }

    func test_eventsByCharacterEndpoint() async throws {
        let characterID = UUID().hashValue
        let endpoint = CharacterEndpoint.events(characterID: characterID)
        let queryItemNames = endpoint.queryItems.compactMap { $0.name }
        XCTAssertEqual(endpoint.scheme , "https")
        XCTAssertEqual(endpoint.baseURL , EnvironmentVariables.baseURL)
        XCTAssertEqual(endpoint.path , "/v1/public/characters/\(characterID)/events")
        XCTAssertEqual(endpoint.queryItems.count , 3)
        XCTAssertTrue(queryItemNames.contains("ts"))
        XCTAssertTrue(queryItemNames.contains("apikey"))
        XCTAssertTrue(queryItemNames.contains("hash"))
        XCTAssertTrue(endpoint.makeRequest() != nil)
    }
}
