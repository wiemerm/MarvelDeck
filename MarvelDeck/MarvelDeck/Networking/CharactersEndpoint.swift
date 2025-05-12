//
//  CharactersEndpoint.swift
//  MarvelDeck
//
//  Created by Megan Wiemer on 5/12/25.
//

import CryptoSwift
import Foundation

enum CharactersEndpoint: Endpoint {
    case characters

    var path: String {
        "/v1/public/characters"
    }

    var queryItems: [URLQueryItem] {
        let timestamp = "\(Int(Date().timeIntervalSince1970))"
        let apiKey = EnvironmentVariables.publicKey
        let privateKey = EnvironmentVariables.privateKey
        let hash = (timestamp + privateKey + apiKey).md5()

        return [
            URLQueryItem(name: "ts", value: timestamp),
            URLQueryItem(name: "apikey", value: apiKey),
            URLQueryItem(name: "hash", value: hash)
        ]
    }

    func makeRequest() -> URLRequest? {
        var components = URLComponents()
        components.scheme = scheme
        components.host = baseUrl
        components.path = path
        components.queryItems = queryItems

        guard let url = components.url else { return nil }

        return URLRequest(url: url)
    }
}
