//
//  ComicCharacter.swift
//  MarvelDeck
//
//  Created by Megan Wiemer on 5/13/25.
//

import Foundation

struct ComicCharacter: Decodable, Identifiable, Equatable {
    struct Thumbnail: Decodable, Equatable {
        let path: String
        let fileExtension: String

        enum CodingKeys: String, CodingKey {
            case path = "path"
            case fileExtension = "extension"
        }
    }

    let id: Int
    let name: String
    let description: String
    let thumbnail: Thumbnail?
    let resourceURI: String? // TODO: Can get rid of?
//    let comics: String? // TODO: Can get rid of?
//    let events: String? // TODO: Can get rid of?

    var thumbnailURL: URL? {
        guard let thumbnail else { return nil }
        return URL(string: "\(thumbnail.path).\(thumbnail.fileExtension)")
    }
}

#if DEBUG
extension ComicCharacter {
    static func mock(
        id: Int = UUID().hashValue,
        name: String = "Ironman",
        description: String = "I am Ironman",
        thubmnail: Thumbnail? = nil,
        resourceURI: String? = nil
    ) -> ComicCharacter {
        ComicCharacter(
            id: id,
            name: name,
            description: description,
            thumbnail: thubmnail,
            resourceURI: resourceURI
        )
    }
}

extension ComicCharacter.Thumbnail {
    static func mock(
        path: String = "http://i.annihil.us/u/prod/marvel/i/mg/3/50/537ba56d31087",
        fileExtension: String = "jpg"
    ) -> ComicCharacter.Thumbnail {
        ComicCharacter.Thumbnail(
            path: path,
            fileExtension: fileExtension
        )
    }
}
#endif
