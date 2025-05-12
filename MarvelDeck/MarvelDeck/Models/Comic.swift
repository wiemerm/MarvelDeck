//
//  Comic.swift
//  MarvelDeck
//
//  Created by Megan Wiemer on 5/12/25.
//

import Foundation

struct ResourceContainer: Codable {
    struct Resource: Codable {
        let resourceURI: String
        let name: String
    }

    let available: Int
    let returned: Int
    let collectionURI: String
    let items: [Resource]
}
