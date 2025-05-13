//
//  Segmented.swift
//  MarvelDeck
//
//  Created by Megan Wiemer on 5/13/25.
//

import SwiftUI

struct Segmented: View {
    @Binding var index: Int

    var body: some View {
        HStack(spacing: 48) {
            SegmentButton(
                isSelected: bindingIsSelected(for: 0, selectedIndex: $index),
                systemImageName: "book.fill",
                text: "48") // Use count of comics

            SegmentButton(
                isSelected: bindingIsSelected(for: 1, selectedIndex: $index),
                systemImageName: "desktopcomputer",
                text: "32") // Use count of events
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
    Segmented(index: $index)
}

struct SegmentButton: View {
    @Binding var isSelected: Bool
    let systemImageName: String
    let text: String

    var body: some View {
        VStack {
            Image(systemName: systemImageName)
                .foregroundStyle(isSelected ? .black: Color(.systemGray4))

            Text(text)
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
