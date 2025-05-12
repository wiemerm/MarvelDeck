//
//  Character.swift
//  MarvelDeck
//
//  Created by Megan Wiemer on 5/12/25.
//

import Foundation

struct Thumbnail: Codable {
    let path: String
    let fileExtension: String

    enum CodingKeys: String, CodingKey {
        case path
        case fileExtension = "extension"
    }
}

struct ComicCharacter: Codable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let thumbnail: Thumbnail?
    let resourceURI: String?
    let comics: ResourceContainer
    let events: ResourceContainer

    var thumbnailURL: URL? {
        guard let thumbnail else { return nil }
        return URL(string: "\(thumbnail.path).\(thumbnail.fileExtension)")
    }

}
