//
//  TagsAdapter.swift
//  TagsAdapter
//
//  Created by Vlad Z. on 7/30/21.
//

import Foundation

class TagsAdapter {
    static func fetch() async throws -> [Tag] {
        try await Networking
            .shared
            .request(with: .init(path: "tags"))
            .map(to: [Tag].self)
    }
}
