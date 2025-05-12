//
//  CharacterDetailsView.swift
//  MarvelDeck
//
//  Created by Megan Wiemer on 5/12/25.
//

import SwiftUI

struct CharacterDetailsView: View {
    let character: ComicCharacter

    var body: some View {
        VStack(alignment: .leading) {
            CharacterHeaderView()
                .padding()

            Spacer()
        }
        .background(Color(.systemGray6))
        .environment(\.comicCharacter, character)
    }
}

#Preview {
    CharacterDetailsView(character: ComicCharacter.mock())
}
