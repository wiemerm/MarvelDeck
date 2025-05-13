//
//  CharacterList.swift
//  MarvelDeck
//
//  Created by Megan Wiemer on 5/13/25.
//

import SwiftUI

struct CharacterList: View {
    @StateObject var viewModel = CharacterListViewModel()

    private let columns = Array(repeating: GridItem(.flexible(), spacing: 1), count: 3)

    var body: some View {
        GeometryReader { geo in
            ScrollView {
                let totalSpacing: CGFloat = 2
                let itemWidth = abs(geo.size.width - totalSpacing) / 3

                LazyVGrid(columns: columns, spacing: 1) {
                    ForEach(viewModel.characters) { character in
                        NavigationLink {
                            CharacterDetailView(character: character)
                        } label: {
                            CharacterGridItem(
                                name: character.name,
                                thumbnailURL: character.thumbnailURL,
                                dimensions: itemWidth
                            )
                        }
                    }
                }
            }
            .onAppear {
                viewModel.loadCharacterList()
            }
        }
    }
}

#Preview {
    NavigationStack {
        CharacterList()
    }
}
