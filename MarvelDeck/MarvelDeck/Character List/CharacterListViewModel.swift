//
//  CharacterListViewModel.swift
//  MarvelDeck
//
//  Created by Megan Wiemer on 5/12/25.
//

import CryptoSwift
import SwiftUI

@Observable
class CharacterListViewModel {
    init() {
        fetchCharcters()
    }

    private func fetchCharcters() {
        Task { @MainActor in
            // TODO: Get a service layer in
            let characterResponse: MarvelResponse? = try? await APIClient().fetch(CharactersEndpoint.characters)
        }
    }
}
