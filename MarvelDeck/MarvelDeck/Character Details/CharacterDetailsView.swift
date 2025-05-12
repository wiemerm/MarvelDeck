//
//  CharacterDetailsView.swift
//  MarvelDeck
//
//  Created by Megan Wiemer on 5/12/25.
//

import SwiftUI

struct CharacterDetailsView: View {
    let character: ComicCharacter
    let columns: [GridItem] = Array(repeating: GridItem(.flexible(), spacing: 4), count: 3)

    @State var selectedTab = 0

    var body: some View {
        VStack(alignment: .center) {
            CharacterHeaderView()
                .padding()

            Segmented()

            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(Array(1...20), id: \.self) { character in
                        Color.blue.overlay {
                            Text("\(character)")
                        }
                        .frame(width: 131, height: 130)
                    }
                }
            }

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color(.systemGray6))
        .environment(\.comicCharacter, character)
    }
}

#Preview {
    CharacterDetailsView(character: ComicCharacter.mock())
}
