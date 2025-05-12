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
    var characters = [ComicCharacter]()

    init() {
    }

    @MainActor
    func fetchCharcters() async {
        do {
            async let response: MarvelResponse = try await APIClient().fetch(CharactersEndpoint.characters)
            characters = try await response.data.results
        } catch {
            print("!!!!! Caught an error: \(error)")
        }
    }
}
