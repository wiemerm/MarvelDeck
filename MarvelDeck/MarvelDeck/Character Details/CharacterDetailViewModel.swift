//
//  CharacterDetailViewModel.swift
//  MarvelDeck
//
//  Created by Megan Wiemer on 5/13/25.
//

import Combine
import SwiftUI

class CharacterDetailViewModel: ObservableObject {
    enum TabType: Int {
        case comics, events
    }

    @Published var comics = [Comic]()
    @Published var events = [Comic]()
    @Published var isLoading = false
    @Published var selectedTab = 0
    @Published var comicCount = 0
    @Published var eventsCount = 0

    let character: ComicCharacter

    private let characterService: CharacterServiceProtocol
    private var cancellables = Set<AnyCancellable>()

    private var selectedType: TabType {
        TabType(rawValue: selectedTab) ?? .comics
    }

    init(character: ComicCharacter, characterService: CharacterServiceProtocol = CharacterService()) {
        self.character = character
        self.characterService = characterService
    }

    func fetchComicsAndEvents() {
        loadMoreComics()
        loadMoreEvents()
    }

    func loadMore(lastItem: Comic) {
        switch selectedType {
        case .comics:
            guard comics.last == lastItem else { return }
            loadMoreComics()
        case .events:
            guard events.last == lastItem else { return }
            loadMoreEvents()
        }
    }

    private func loadMoreComics() {
        Task { @MainActor in
            do {
                isLoading = true
                let comicData = try await characterService.fetchComics(for: character.id, offset: comics.count)
                comics.append(contentsOf: comicData.results)
                comicCount = comicData.total
                isLoading = false
            } catch {
                isLoading = false
                debugPrint("!!!! Handle the error and show an alert !!!!")
            }
        }
    }

    private func loadMoreEvents() {
        Task { @MainActor in
            do {
                isLoading = true
                let eventData = try await characterService.fetchEvents(for: character.id, offset: events.count)
                events.append(contentsOf: eventData.results)
                eventsCount = eventData.total
                isLoading = false
            } catch {
                isLoading = false
                debugPrint("!!!! Handle the error and show an alert !!!!")
            }
        }
    }
}
