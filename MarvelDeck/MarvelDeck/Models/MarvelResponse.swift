//
//  MarvelResponse.swift
//  MarvelDeck
//
//  Created by Megan Wiemer on 5/12/25.
//

import Foundation

struct MarvelResponse: Codable {
    let code: Int
    let status: String
    let copyright: String
    let data: MarvelDataContainer
}

struct MarvelDataContainer: Codable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [ComicCharacter]
}
