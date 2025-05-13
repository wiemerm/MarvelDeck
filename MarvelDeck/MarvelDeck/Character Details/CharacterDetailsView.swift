//
//  CharacterDetailsView.swift
//  MarvelDeck
//
//  Created by Megan Wiemer on 5/12/25.
//

import SwiftUI

struct CharacterDetailsView: View {
    @Environment(\.dismiss) var dismiss
    @State var selectedTab = 0
    @State var viewModel: CharacterDetailViewModel

    let columns: [GridItem] = Array(repeating: GridItem(.flexible(), spacing: 4), count: 3)

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            CharacterHeaderView()
                .padding()

            Segmented()
                .padding(.bottom, 24)
                .padding(.top, 48)

            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(Array(1...20), id: \.self) { character in
                        Color.blue.overlay {
                            Text("\(character)")
                        }
                        .frame(
                            minWidth: 120,
                            maxWidth: 140,
                            minHeight: 120,
                            maxHeight: 140)
                    }
                }
            }

        }
        .background(Color(.systemGray6))
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    dismiss()
                }, label: {
                    Label("", systemImage: "chevron.backward")
                })
                .tint(.black)
            }
        }
        .environment(\.comicCharacter, viewModel.character)
    }

    init(character: ComicCharacter) {
        viewModel = CharacterDetailViewModel(character: character)
    }
}

#Preview {
    CharacterDetailsView(character: ComicCharacter.mock())
}
