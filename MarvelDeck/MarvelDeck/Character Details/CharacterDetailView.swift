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
        GeometryReader { geo in
            let totalSpacing: CGFloat = 8
            let itemWidth = abs(geo.size.width - totalSpacing) / 3
            VStack(spacing: 0) {
                CharacterHeaderView()

                Segmented(
                    index: $viewModel.selectedTab,
                    tabs: [
                        (text: "\(viewModel.comicCount)", systemImageName: "book.fill"),
                        (text: "\(viewModel.eventsCount)", systemImageName: "desktopcomputer")
                    ]
                )
                .padding(.bottom, 24)
                .padding(.top, 48)

                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(viewModel.gridData) { item in
                            ThumbnailGridItem(
                                name: nil,
                                thumbnailURL: item.thumbnailURL,
                                dimensions: itemWidth
                            )
                        }
                    }
                }
            }
            .background(Color(.systemGray6))
        }
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
