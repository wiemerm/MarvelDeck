//
//  MockCharacterService.swift
//  MarvelDeckTests
//
//  Created by Megan Wiemer on 5/13/25.
//

import Foundation
@testable import MarvelDeck

class MockCharacterService: CharacterServiceProtocol {
    var charactersToReturn: [ComicCharacter]?
    var errorToThrow: Error?

    private(set) var fetchCharactersCallCount = 0

    func fetchCharactersList() async throws -> [ComicCharacter] {
        fetchCharactersCallCount += 1

        if let charactersToReturn {
            return charactersToReturn
        } else if let errorToThrow {
            throw errorToThrow
        }

        throw TestError.fakeError(message: "No characters set to return or error declared to throw")
    }
}
