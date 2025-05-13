//
//  Segmented.swift
//  MarvelDeck
//
//  Created by Megan Wiemer on 5/13/25.
//

import SwiftUI

typealias SegmentItem = (text: String, systemImageName: String)

struct Segmented: View {
    @Binding var index: Int
    let tabs: [SegmentItem]

    var body: some View {
        HStack(spacing: 48) {
            ForEach(tabs.indices, id: \.self) { index in
                SegmentButton(
                    isSelected: bindingIsSelected(for: index, selectedIndex: $index),
                    item: tabs[index]
                )
            }
        }
    }

    func bindingIsSelected(for index: Int, selectedIndex: Binding<Int>) -> Binding<Bool> {
        Binding<Bool>(
            get: { selectedIndex.wrappedValue == index },
            set: { isSelected in
                if isSelected {
                    selectedIndex.wrappedValue = index
                }
            }
        )
    }
}

#Preview {
    @Previewable @State var index = 0
    Segmented(index: $index, tabs: [("book.fill", "42"), ("desktopcomputer", "36")])
}

struct SegmentButton: View {
    @Binding var isSelected: Bool
    let item: SegmentItem

    var body: some View {
        VStack {
            Image(systemName: item.systemImageName)
                .foregroundStyle(isSelected ? .black: Color(.systemGray4))

            Text(item.text)
                .foregroundStyle(isSelected ? .black: Color(.systemGray4))
        }
        .frame(width: 84, height: 56)
        .background(.white.opacity(isSelected ? 1 : 0))
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .onTapGesture {
            isSelected = true
        }
    }
}
