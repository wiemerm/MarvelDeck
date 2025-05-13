//
//  CharacterGridItem.swift
//  MarvelDeck
//
//  Created by Megan Wiemer on 5/13/25.
//

import SwiftUI

struct CharacterGridItem: View {
    let name: String
    let thumbnailURL: URL?
    let dimensions: CGFloat

    var body: some View {
        AsyncImage(url: thumbnailURL) { image in
            image
                .resizable()
                .frame(width: dimensions, height: dimensions)
        } placeholder: {
            Rectangle()
                .fill(Color(.systemGray6))
                .frame(width: dimensions, height: dimensions)
        }
        .overlay {
            Text(name)
                .foregroundStyle(Color.white)
                .font(.caption2)
                .padding(8)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                .background {
                    LinearGradient(colors: [.black, .clear], startPoint: .bottom, endPoint: .center)
                        .opacity(0.5)
                }
        }
    }
}

#Preview {
    CharacterGridItem(
        name: "Captain America",
        thumbnailURL: URL(string: "https://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available.jpg"),
        dimensions: 120
    )
}
