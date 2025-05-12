//
//  Endpoint.swift
//  MarvelDeck
//
//  Created by Megan Wiemer on 5/12/25.
//

import Foundation

protocol Endpoint {
    var baseUrl: String { get }
    var scheme: String { get }
    var path: String { get }
    var queryItems: [URLQueryItem] { get }

    func makeRequest() -> URLRequest?
}

extension Endpoint {
    var baseUrl: String {
        EnvironmentVariables.baseURL ?? ""
    }

    var scheme: String {
        "https"
    }
}

