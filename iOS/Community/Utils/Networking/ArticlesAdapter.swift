//
//  ArticlesAdapter.swift
//  Community
//
//  Created by Vlad Z. on 6/13/21.
//

import Foundation

class ArticlesAdapter {
    static func fetchLatest() async throws -> [Article] {
        try await Networking
            .shared
            .request(with: .init(path: "articles/me"))
            .map(to: [Article].self)
    }
    
    static func create(title: String,
                       body: String,
                       tags: [String]) async throws -> Article {
        try await Networking
            .shared
            .request(with: .init(path: "articles", 
                                 params: ["article": ["title": title,
                                                      "published": true,
                                                      "body_markdown": body,
                                                      "tags": tags]], 
                                 type: .post))
            .map(to: Article.self)
    }
}
