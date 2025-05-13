//
//  CharacterServiceTests.swift
//  MarvelDeckTests
//
//  Created by Megan Wiemer on 5/13/25.
//

import XCTest
@testable import MarvelDeck

final class CharacterServiceTests: XCTestCase {
    var mockAPIClient: MockAPIClient!
    var service: CharacterService!

    override func setUpWithError() throws {
        mockAPIClient = MockAPIClient()
        service = CharacterService(apiClient: mockAPIClient)
    }

    func test_fetchCharactersList_callsThroughToClient() async throws {
        let expected = Array(repeating: ComicCharacter.mock(), count: Int.random(in: 1..<10))
        let response = CharacterResponse.mock(data: CharacterData.mock(results: expected))
        mockAPIClient.responseToReturn = response

        let characters = try await service.fetchCharactersList()

        XCTAssertEqual(mockAPIClient.fetchCallCount, 1)
        XCTAssertEqual(mockAPIClient.endpointArg?.path, CharacterEndpoint.characters.path)
        XCTAssertEqual(characters.count, expected.count)
        XCTAssertEqual(characters, expected)
    }
}
