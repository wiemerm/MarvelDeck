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

    var body: some View {
        GeometryReader { geo in
            let totalSpacing: CGFloat = 8
            let itemWidth = abs(geo.size.width - totalSpacing) / 3
            VStack(spacing: 0) {
                CharacterHeaderView()
                    .padding(.bottom, 48)

                Segmented(
                    index: $viewModel.selectedTab,
                    tabs: [
                        (text: "\(viewModel.comicCount)", systemImageName: "book.fill"),
                        (text: "\(viewModel.eventsCount)", systemImageName: "desktopcomputer")
                    ]
                )

                ScrollView {
                    if viewModel.selectedTab == 0 {
                        ThumbnailGridView(data: viewModel.comics, itemWidth: itemWidth, loadingHandler: viewModel.loadMore)
                    } else {
                        ThumbnailGridView(data: viewModel.events, itemWidth: itemWidth, loadingHandler: viewModel.loadMore)
                    }

                    if viewModel.isLoading {
                        ProgressView()
                    }
                }
                .padding(.top, 24)

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
