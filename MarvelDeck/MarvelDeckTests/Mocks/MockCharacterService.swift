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
    var comicsToReturn: [Comic]?
    var eventsToReturn: [Comic]?
    var errorToThrow: Error?

    private(set) var fetchCharactersCallCount = 0
    private(set) var fetchComicsCallCount = 0
    private(set) var fetchEventsCallCount = 0

    private(set) var offsetArg: Int?
    private(set) var characterIDArg: Int?

    func fetchCharactersList(offset: Int) async throws -> [ComicCharacter] {
        fetchCharactersCallCount += 1
        offsetArg = offset

        if let charactersToReturn {
            return charactersToReturn
        } else if let errorToThrow {
            throw errorToThrow
        }

        throw TestError.fakeError(message: "No characters set to return or error declared to throw")
    }

    func fetchComics(for characterID: Int) async throws -> [Comic] {
        fetchComicsCallCount += 1
        characterIDArg = characterID

        if let comicsToReturn {
            return comicsToReturn
        } else if let errorToThrow {
            throw errorToThrow
        }

        throw TestError.fakeError(message: "No characters set to return or error declared to throw")
    }

    func fetchEvents(for characterID: Int) async throws -> [Comic] {
        fetchEventsCallCount += 1
        characterIDArg = characterID

        if let eventsToReturn {
            return eventsToReturn
        } else if let errorToThrow {
            throw errorToThrow
        }

        throw TestError.fakeError(message: "No characters set to return or error declared to throw")
    }
}
