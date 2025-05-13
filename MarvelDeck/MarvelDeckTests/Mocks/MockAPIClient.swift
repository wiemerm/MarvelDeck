//
//  MockAPIClient.swift
//  MarvelDeckTests
//
//  Created by Megan Wiemer on 5/13/25.
//

import Foundation
@testable import MarvelDeck

class MockAPIClient: APISendable {
    var responseToReturn: (any Decodable)?
    var errorToThrow: Error?

    private(set) var fetchCallCount = 0
    private(set) var endpointArg: Endpoint?

    func fetch<T>(_ endpoint: any Endpoint) async throws -> T where T : Decodable {
        fetchCallCount += 1
        endpointArg = endpoint

        if let responseToReturn = responseToReturn as? T {
            return responseToReturn
        } else if let errorToThrow = errorToThrow {
            throw errorToThrow
        }

        throw TestError.fakeError(message: "Fake error not set via test")
    }
}

enum TestError: Error {
    case fakeError(message: String)
}

