//
//  CharacterResponse.swift
//  MarvelDeck
//
//  Created by Megan Wiemer on 5/13/25.
//

import Foundation

struct CharacterResponse: Decodable {
    let code: Int
    let status: String
    let data: CharacterData
}

struct CharacterData: Decodable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [ComicCharacter]
}

extension CharacterResponse {
    static func mock(
        code: Int = 200,
        status: String = "Success",
        data: CharacterData = CharacterData.mock()
    ) -> CharacterResponse {
        CharacterResponse(
            code: code,
            status: status,
            data: data
        )
    }
}

extension CharacterData {
    static func mock(
        offset: Int = 200,
        limit: Int = 100,
        total: Int = 1000,
        results: [ComicCharacter] = []
    ) -> CharacterData {
        CharacterData(
            offset: offset,
            limit: limit,
            total: total,
            count: results.count,
            results: results
        )
    }
}
