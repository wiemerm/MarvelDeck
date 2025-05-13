//
//  CharacterDetailViewModelTests.swift
//  MarvelDeckTests
//
//  Created by Megan Wiemer on 5/13/25.
//

import Combine
import XCTest
@testable import MarvelDeck

final class CharacterDetailViewModelTests: XCTestCase {
    var mockService: MockCharacterService!
    var viewModel: CharacterDetailViewModel!
    var cancellables = Set<AnyCancellable>()

    override func setUpWithError() throws {
        let character = ComicCharacter.mock()
        mockService = MockCharacterService()
        viewModel = CharacterDetailViewModel(character: character, characterService: mockService)
    }

    func testOnLoadComicListSuccess() async throws {
        let expect = expectation(description: "fetch comics")
        let expected = Array(repeating: Comic.mock(), count: Int.random(in: 1...10))

        mockService.comicsToReturn = expected
        mockService.eventsToReturn = []

        viewModel.$gridData
            .filter { !$0.isEmpty }
            .sink { comics in
                XCTAssertEqual(comics.count, expected.count)
                XCTAssertEqual(comics, expected)
                expect.fulfill()
            }
            .store(in: &cancellables)

        viewModel.fetchComicsAndEvents()
        viewModel.selectedTab = 0

        await fulfillment(of: [expect], timeout: 5)

        XCTAssertEqual(mockService.fetchComicsCallCount, 1)
    }
}
