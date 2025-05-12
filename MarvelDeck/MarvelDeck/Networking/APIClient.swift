//
//  APIClient.swift
//  MarvelDeck
//
//  Created by Megan Wiemer on 5/12/25.
//

import Foundation

protocol APISendable {
    func fetch<T:Decodable>(_ endpoint: Endpoint) async throws -> T
}

struct APIClient: APISendable {
    func fetch<T: Decodable>(_ endpoint: Endpoint) async throws -> T {
        guard let request = endpoint.makeRequest() else {
            throw APIError.invalidURL
        }

        do {
            // TODO: Commented out while using json file
//            let (data, _) = try await URLSession.shared.data(for: request)
//            let decoder = JSONDecoder()
//            try decoder.decode(T.self, from: data)

            guard let data: MarvelResponse? = Bundle.main.load(json: "characters") else {
                throw APIError.decodingFailed
            }

            guard let response = data as? T else {
                throw APIError.decodingFailed
            }

            return response

        } catch {
            throw APIError.decodingFailed
        }
    }
}

enum APIError: Error {
    case invalidURL
    case decodingFailed
    case caught(Error)

    var userFriendlyDescription: String {
        switch self {
        case .invalidURL, .caught:
            "Something went wrong while fetching data. Please try again later."
        case .decodingFailed:
            "We ran into a problem processing the response. Please try again later."
        }
    }
}
