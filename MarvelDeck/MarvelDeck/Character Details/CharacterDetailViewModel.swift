//
//  CharacterDetailViewModel.swift
//  MarvelDeck
//
//  Created by Megan Wiemer on 5/13/25.
//

import Combine
import SwiftUI

class CharacterDetailViewModel: ObservableObject {
    @Published var gridData = [Comic]()
    @Published var selectedTab = 0

    let character: ComicCharacter
    var comicCount: Int { comics.count }
    var eventsCount: Int { events.count }

    private let characterService: CharacterServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    private var comics = [Comic]()
    private var events = [Comic]()

    init(character: ComicCharacter, characterService: CharacterServiceProtocol = CharacterService()) {
        self.character = character
        self.characterService = characterService

        setUpObservers()
    }

    func fetchComicsAndEvents() {
        Task { @MainActor in
            do {
                comics = try await characterService.fetchComics(for: character.id)
                events = try await characterService.fetchEvents(for: character.id)
                loadComics()
            } catch {
                debugPrint("!!!! Handle the error and show an alert !!!!")
            }
        }
    }

    func loadComics() {
        gridData = comics
    }

    func loadEvents() {
        gridData = events
    }

    private func setUpObservers() {
        $selectedTab.sink { [weak self] tab in
            guard let self else { return
            }
            if tab == 0 {
                loadComics()
            } else {
                loadEvents()
            }
        }
        .store(in: &cancellables)
    }
}
