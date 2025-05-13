//
//  CharacterDetailView.swift
//  MarvelDeck
//
//  Created by Megan Wiemer on 5/13/25.
//

import SwiftUI

struct CharacterDetailView: View {
    let character: ComicCharacter // TODO: Move this to viewModel
    @Environment(\.dismiss) var dismiss
    @State var selectedTab = 0 // TODO: This will move to the view model

    private let columns = Array(repeating: GridItem(.flexible(minimum: 120, maximum: 140), spacing: 4), count: 3)

    var body: some View {
        VStack(spacing: 0) {
            CharacterHeaderView()

            Segmented(index: $selectedTab)
                .padding(.bottom, 24)
                .padding(.top, 48)

            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(Array(0..<20), id: \.self) { character in
                        Color.blue.overlay {
                            Text("\(character)")
                        }
                        .frame(minHeight: 120, maxHeight: 140)
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
        .environment(\.comicCharacter, character)
    }
}

#Preview {
    CharacterDetailView(character: ComicCharacter.mock())
}
