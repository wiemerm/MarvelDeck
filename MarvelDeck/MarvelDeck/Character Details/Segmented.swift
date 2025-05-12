//
//  Segmented.swift
//  MarvelDeck
//
//  Created by Megan Wiemer on 5/12/25.
//

import SwiftUI

struct Segmented: View {
    // TODO: This should become a binding
    @State var index = 0

    var body: some View {
            HStack(spacing: 48) {
                VStack {
                    Image(systemName: "book.fill")
                        .foregroundColor(self.index == 0 ? .black : .systemGray4)
                    Text("48")
                        .foregroundColor(self.index == 0 ? .black : .systemGray4)
                }
                .frame(width: 84, height: 56)
                .background((Color.white).opacity(self.index == 0 ? 1 : 0))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .onTapGesture {
                    self.index = 0
                }

                VStack {
                    Image(systemName: "desktopcomputer")
                        .foregroundColor(self.index == 1 ? .black : .systemGray4)
                    Text("32")
                        .foregroundColor(self.index == 1 ? .black : .systemGray4)
                }
                .frame(width: 84, height: 56)

                .background((Color.white).opacity(self.index == 1 ? 1 : 0))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .onTapGesture {
                    self.index = 1
                }
            }
    }
}
