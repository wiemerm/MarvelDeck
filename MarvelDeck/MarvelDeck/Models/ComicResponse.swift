//
//  ComicResponse.swift
//  MarvelDeck
//
//  Created by Megan Wiemer on 5/13/25.
//

import Foundation

struct ComicResponse: Decodable {
    let code: Int
    let status: String
    let data: ComicData
}

struct ComicData: Decodable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [Comic]
}


extension ComicResponse {
    static func mock(
        code: Int = 200,
        status: String = "Success",
        data: ComicData = ComicData.mock()
    ) -> ComicResponse {
        ComicResponse(
            code: code,
            status: status,
            data: data
        )
    }
}

extension ComicData {
    static func mock(
        offset: Int = 200,
        limit: Int = 100,
        total: Int = 1000,
        results: [Comic] = []
    ) -> ComicData {
        ComicData(
            offset: offset,
            limit: limit,
            total: total,
            count: results.count,
            results: results
        )
    }
}
