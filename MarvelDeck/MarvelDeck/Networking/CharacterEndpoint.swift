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
    case comics(characterID: Int, offset: Int)
    case events(characterID: Int, offset: Int)

    var path: String {
        switch self {
        case .characters:              "/v1/public/characters"
        case .character(let id):       "/v1/public/characters/\(id)"
        case .comics(let characterID, _): "/v1/public/characters/\(characterID)/comics"
        case .events(let characterID, _): "/v1/public/characters/\(characterID)/events"
        }
    }

    var queryItems: [URLQueryItem] {
        // Setting up hash using CryptoKit results in "The passed API key is invalid."
        let timestamp = Int(Date().timeIntervalSince1970).description
        let publicKey = EnvironmentVariables.publicKey
        let privateKey = EnvironmentVariables.privateKey
        let hashString = timestamp + privateKey + publicKey

        guard let data = hashString.data(using: .utf8) else {
            return []
        }

        let digest = Insecure.MD5.hash(data: data)

        let hash =  digest.map {
            String(format: "%02hhx", $0)
        }.joined()

        // Found from https://github.com/9Yogesh9/Marvel-API/blob/main/assests/scripts/script.js
        // and appears to be a working hash
//        let timestamp = "1670913383902"
//        let publicKey = "edc9531ea872c74a2855ed93a5903229"
//        let hash = "bbb581dcf34e4752243b361daa960fb1"

        var queryItems = [
            URLQueryItem(name: "ts", value: timestamp),
            URLQueryItem(name: "apikey", value: publicKey),
            URLQueryItem(name: "hash", value: hash)
        ]

        switch self {
        case .characters(let offset): queryItems.append(URLQueryItem(name: "offset", value: String(offset)))
        case .comics(_, let offset), .events(_, let offset): queryItems.append(URLQueryItem(name: "offset", value: String(offset)))
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
