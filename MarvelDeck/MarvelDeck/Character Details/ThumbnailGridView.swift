//
//  ThumbnailGridView.swift
//  MarvelDeck
//
//  Created by Megan Wiemer on 5/14/25.
//

import SwiftUI

struct ThumbnailGridView: View {
    let data: [Comic]
    let itemWidth: CGFloat
    let loadingHandler: (Comic) -> Void

    private let columns = Array(repeating: GridItem(.flexible(), spacing: 4), count: 3)

    var body: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(data) { item in
                ThumbnailGridItem(
                    name: nil,
                    thumbnailURL: item.thumbnailURL,
                    dimensions: itemWidth
                )
                .onAppear {
                    loadingHandler(item)
                }
            }
        }
    }
}

#Preview {
    ThumbnailGridView(
        data: Array(repeating: Comic.mock(), count: 3),
        itemWidth: 120,
        loadingHandler: { _ in })
}
