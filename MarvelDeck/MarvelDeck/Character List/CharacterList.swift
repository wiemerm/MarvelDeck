//
//  CharacterList.swift
//  MarvelDeck
//
//  Created by Megan Wiemer on 5/11/25.
//

import CryptoKit
import SwiftUI

struct CharacterList: View {
    @State var viewModel = CharacterListViewModel()
    let items = Array(1...100)

    let columns: [GridItem] = Array(repeating: GridItem(.flexible(), spacing: 1), count: 3)

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                let totalSpacing: CGFloat = 2
                let itemWidth = abs(geometry.size.width - totalSpacing) / 3

                LazyVGrid(columns: columns, spacing: 1) {
                    ForEach(items, id: \.self) { item in
                        CharacterGridItem(name: "\(item)", itemWidth: itemWidth)
                    }
                }
            }
        }
    }

    func md5Hash(_ source: String) -> String {
        Insecure.MD5.hash(data: source.data(using: .utf8)!).map { String(format: "%02hhx", $0) }.joined()
    }
}

#Preview {
    CharacterList()
}
