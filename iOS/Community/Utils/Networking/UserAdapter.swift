//
//  UserAdapter.swift
//  UserAdapter
//
//  Created by Vlad Z. on 8/1/21.
//

import Foundation

class UserAdapter {
    static func fetch() async throws -> User {
        try await Networking
            .shared
            .request(with: .init(path: "users/me"))
            .map(to: User.self)
    }
}
