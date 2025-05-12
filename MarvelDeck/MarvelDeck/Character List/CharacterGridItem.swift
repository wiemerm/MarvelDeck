//
//  CharacterGridItem.swift
//  MarvelDeck
//
//  Created by Megan Wiemer on 5/11/25.
//

import SwiftUI

struct CharacterGridItem: View {
    let name: String
    let itemWidth: CGFloat

    var body: some View {
        Rectangle()
            .fill(Color.blue)
            .frame(width: itemWidth, height: itemWidth)
            .overlay(
                Text("\(name)").foregroundStyle(Color.white)
                    .font(.caption)
                    .padding(8)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                )

    }
}

#Preview {
    CharacterGridItem(name: "Captain America", itemWidth: 120)
}
