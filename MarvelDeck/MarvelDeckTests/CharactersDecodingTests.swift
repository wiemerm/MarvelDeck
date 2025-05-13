//
//  DecodingTests.swift
//  MarvelDeckTests
//
//  Created by Megan Wiemer on 5/13/25.
//

import XCTest
@testable import MarvelDeck

final class DecodingTests: XCTestCase {
    func test_canDecodeListOfCharactersResponse() {
        let jsonFile = "characters"
        let results: CharacterResponse? = Bundle(for: DecodingTests.self).load(json: jsonFile)

        XCTAssertNotNil(results)
    }

    func test_canDecodeSingleCharacterResponse() {
        let jsonFile = "character"
        let results: CharacterResponse? = Bundle(for: DecodingTests.self).load(json: jsonFile)

        XCTAssertNotNil(results)
    }

    func test_canDecodeComicsResponse() {
        let jsonFile = "comics"
        let results: ComicResponse? = Bundle(for: DecodingTests.self).load(json: jsonFile)

        XCTAssertNotNil(results)
    }

    func test_canDecodeEventsResponse() {
        let jsonFile = "events"
        let results: ComicResponse? = Bundle(for: DecodingTests.self).load(json: jsonFile)

        XCTAssertNotNil(results)
    }
}
