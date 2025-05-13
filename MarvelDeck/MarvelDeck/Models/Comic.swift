//
//  Comic.swift
//  MarvelDeck
//
//  Created by Megan Wiemer on 5/13/25.
//

import Foundation

struct Comic: Decodable, Identifiable, Equatable {
    let id: Int
    let title: String
    let thumbnail: Thumbnail?

    var thumbnailURL: URL? {
        guard let thumbnail else { return nil }
        return URL(string: "\(thumbnail.path).\(thumbnail.fileExtension)")
    }
}

extension Comic {
    static func mock(
        id: Int = UUID().hashValue,
        title: String = "Mock Comic",
        thumbnail: Thumbnail? = nil
    ) -> Comic {
        Comic(
            id: id,
            title: title,
            thumbnail: thumbnail
        )
    }
}
