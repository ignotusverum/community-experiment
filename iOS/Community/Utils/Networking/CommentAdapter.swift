//
//  CommentAdapter.swift
//  CommentAdapter
//
//  Created by Vlad Z. on 7/30/21.
//

import Foundation

class CommentAdapter {
    static func fetch(articleId: Int) async throws -> [Comment] {
        try await Networking
            .shared
            .request(with: .init(path: "comments",
                                 queryItems: [.init(name: "a_id", 
                                                    value: "\(articleId)")]))
            .map(to: [Comment].self)
    }
}
