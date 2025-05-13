//
//  CharacterEndpoint.swift
//  MarvelDeck
//
//  Created by Megan Wiemer on 5/13/25.
//

import Foundation

enum CharacterEndpoint: Endpoint {
    case characters
    case character(id: Int)
    case comics(characterID: Int)
    case events(characterID: Int)

    var path: String {
        switch self {
        case .characters:              "/v1/public/characters"
        case .character(let id):       "/v1/public/characters/\(id)"
        case .comics(let characterID): "/v1/public/characters/\(characterID)/comics"
        case .events(let characterID): "/v1/public/characters/\(characterID)/events"
        }
    }

    var queryItems: [URLQueryItem] {
        let timestamp = "1670913383902"
        let apiKey = "edc9531ea872c74a2855ed93a5903229"
        let hash = "bbb581dcf34e4752243b361daa960fb1"

        return [
            URLQueryItem(name: "ts", value: timestamp),
            URLQueryItem(name: "apikey", value: apiKey),
            URLQueryItem(name: "hash", value: hash)
        ]
    }

    func makeRequest() -> URLRequest? {
        var components = URLComponents()
        components.scheme = scheme
        components.host = baseURL
        components.path = path
        components.queryItems = queryItems

        guard let url = components.url else { return nil }

        return URLRequest(url: url)
    }
}
