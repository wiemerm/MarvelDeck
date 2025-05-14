//
//  CharacterEndpoint.swift
//  MarvelDeck
//
//  Created by Megan Wiemer on 5/13/25.
//

import CryptoKit
import Foundation

enum CharacterEndpoint: Endpoint {
    case characters(offset: Int)
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
//        let timestamp = "\(Int(Date().timeIntervalSince1970))"
//              let apiKey = EnvironmentVariables.publicKey
//              let privateKey = EnvironmentVariables.privateKey
//              let hashString = (timestamp + privateKey + apiKey)
//
//        let digest = Insecure.MD5.hash(data: Data(hashString.utf8))
//
//        let hash =  digest.map {
//            String(format: "%02hhx", $0)
//        }.joined()

        let timestamp = "1670913383902"
        let apiKey = "edc9531ea872c74a2855ed93a5903229"
        let hash = "bbb581dcf34e4752243b361daa960fb1"

        var queryItems = [
            URLQueryItem(name: "ts", value: timestamp),
            URLQueryItem(name: "apikey", value: apiKey),
            URLQueryItem(name: "hash", value: hash)
        ]

        switch self {
        case .characters(let offset): queryItems.append(URLQueryItem(name: "offset", value: String(offset)))
        default: break
        }

        return queryItems
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
