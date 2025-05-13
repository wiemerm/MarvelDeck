//
//  CharacterListViewModelTests.swift
//  MarvelDeckTests
//
//  Created by Megan Wiemer on 5/13/25.
//

import Combine
import XCTest
@testable import MarvelDeck

final class CharacterListViewModelTests: XCTestCase {
    var mockService: MockCharacterService!
    var viewModel: CharacterListViewModel!
    var cancellables = Set<AnyCancellable>()

    override func setUpWithError() throws {
        mockService = MockCharacterService()
        viewModel = CharacterListViewModel(characterService: mockService)
    }

    func testOnLoadCharacterListSuccess() async throws {
        let expect = expectation(description: "fetch characters")
        let expected = Array(repeating: ComicCharacter.mock(), count: Int.random(in: 1..<10))
        mockService.charactersToReturn = expected

        viewModel.$characters
            .dropFirst()
            .sink { characters in
                XCTAssertEqual(characters.count, expected.count)
                XCTAssertEqual(characters, expected)
                expect.fulfill()
            }
            .store(in: &cancellables)

        viewModel.loadCharacterList()

        await fulfillment(of: [expect], timeout: 3)
        XCTAssertEqual(mockService.fetchCharactersCallCount, 1)
    }
}
