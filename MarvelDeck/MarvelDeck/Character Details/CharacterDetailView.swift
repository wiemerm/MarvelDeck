//
//  CharacterDetailView.swift
//  MarvelDeck
//
//  Created by Megan Wiemer on 5/13/25.
//

import SwiftUI

struct CharacterDetailView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject private var viewModel: CharacterDetailViewModel

    private let columns = Array(repeating: GridItem(.flexible(minimum: 120, maximum: 140), spacing: 4), count: 3)

    var body: some View {
        VStack(spacing: 0) {
            CharacterHeaderView()

            Segmented(index: $viewModel.selectedTab)
                .padding(.bottom, 24)
                .padding(.top, 48)

            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewModel.gridData) { item in
                        ThumbnailGridItem(
                            name: nil,
                            thumbnailURL: item.thumbnailURL,
                            dimensions: 120
                        )
                    }
                }
            }
        }
        .background(Color(.systemGray6))
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: { dismiss() }, label: {
                    Label("", systemImage: "chevron.backward")
                })
                .tint(.black)
            }
        }
        .environment(\.comicCharacter, viewModel.character)
        .onAppear {
            viewModel.fetchComicsAndEvents()
        }
    }

    init(character: ComicCharacter) {
        viewModel = CharacterDetailViewModel(character: character)
    }
}

#Preview {
    CharacterDetailView(character: ComicCharacter.mock())
}
