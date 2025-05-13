//
//  CharacterHeaderView.swift
//  MarvelDeck
//
//  Created by Megan Wiemer on 5/12/25.
//

import SwiftUI

struct CharacterHeaderView: View {
    @Environment(\.comicCharacter) var character

    var body: some View {
        if let character {
            VStack {
                HStack(alignment: .center) {
                    Text(character.name)
                        .font(.title3)
                        .alignmentGuide(VerticalAlignment.center) { d in
                            d[.firstTextBaseline]
                        }

                    Spacer()

                    AsyncImage(url: character.thumbnailURL) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                    } placeholder: {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                    }
                }
                .padding()

                Text(character.description)
                    .lineLimit(2)
                    .font(.callout)
                    .foregroundColor(.primary)
                    .gridCellColumns(2)
                    .padding(.bottom, 32)
            }
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 8)
                    .fill(.white)
            }
        } else {
            EmptyView()
        }
    }
}

#Preview {
    VStack {
        CharacterHeaderView()
            .environment(\.comicCharacter, ComicCharacter.mock())
            .padding()
        Spacer()
    }
    .background(Color(.systemGray6))
}
