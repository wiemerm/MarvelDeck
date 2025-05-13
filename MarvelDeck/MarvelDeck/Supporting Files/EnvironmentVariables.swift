//
//  EnvironmentVariables.swift
//  MarvelDeck
//
//  Created by Megan Wiemer on 5/13/25.
//

import Foundation

struct EnvironmentVariables {
    enum Keys {
        static let publicKey = "PUBLIC_KEY"
        static let privateKey = "PRIVATE_KEY"
        static let baseURL = "BASE_URL"
    }

    static let publicKey: String = {
        EnvironmentVariables.infoDict[Keys.publicKey] as? String ?? ""
    }()

    static let privateKey: String = {
        EnvironmentVariables.infoDict[Keys.privateKey] as? String ?? ""
    }()

    static let baseURL: String = {
        EnvironmentVariables.infoDict[Keys.baseURL] as? String ?? ""
    }()

    private static let infoDict: [String: Any] = {
        Bundle.main.infoDictionary ?? [:]
    }()
}
