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
    let comics: ResourceContainer?
    let events: ResourceContainer?

    var thumbnailURL: URL? {
        guard let thumbnail else { return nil }
        return URL(string: "\(thumbnail.path).\(thumbnail.fileExtension)")
    }
}

extension ComicCharacter {
    static func mock(
        id: Int = UUID().hashValue,
        name: String = "Captain America",
        // swiftlint:disable:next line_length
        description: String = "Vowing to serve his country any way he could, young Steve Rogers took the super soldier serum to become America's one-man army. Fighting for the red, white and blue for over 60 years, Captain America is the living, breathing symbol of freedom and liberty.",
        thumbnail: Thumbnail? = Thumbnail.mock(),
        resourceURI: String? = nil,
        comics: ResourceContainer? = nil,
        events: ResourceContainer? = nil
    ) -> ComicCharacter {
        ComicCharacter(
            id: id,
            name: name,
            description: description,
            thumbnail: thumbnail,
            resourceURI: resourceURI,
            comics: comics,
            events: events
        )
    }
}

extension Thumbnail {
    static func mock(
        path: String = "http://i.annihil.us/u/prod/marvel/i/mg/3/50/537ba56d31087",
        fileExtension: String = "jpg"
    ) -> Thumbnail {
        Thumbnail(path: path, fileExtension: fileExtension)
    }
}
