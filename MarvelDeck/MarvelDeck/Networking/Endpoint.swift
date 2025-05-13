//
//  Endpoint.swift
//  MarvelDeck
//
//  Created by Megan Wiemer on 5/13/25.
//

import Foundation

protocol Endpoint {
    var baseURL: String { get }
    var scheme: String { get }
    var path: String { get }
    var queryItems: [URLQueryItem] { get }

    func makeRequest() -> URLRequest?
}

extension Endpoint {
    var baseURL: String {
        EnvironmentVariables.baseURL
    }

    var scheme: String {
        "https"
    }
}
