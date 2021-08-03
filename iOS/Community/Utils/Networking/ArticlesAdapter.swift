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
                                                      "body_markdown": body,
                                                      "published": true,
                                                      "tags": tags]], 
                                 type: .post))
            .map(to: Article.self)
    }
}

class ArticlesGraphQLAdapter {
    static func fetchLatest() async throws -> [Article] {
        try await withCheckedThrowingContinuation({ continuation in
            GraphQLNetworking.shared.apollo.fetch(query: GetFeedQuery.init(limit: 50)) { result in
                switch result {
                case let .success(data):
                    guard let feed = data.data?.getFeed else { return continuation.resume(returning: []) }
                    let mappedFeed = feed.nodes?.map { node in 
                        Article(id: Int.random(in: 0...100), title: node.seoDetail.title, description: node.shortContent ?? "", commentsCount: node.repliesCount, positiveReactionsCount: node.reactionsCount, user: User(name: node.owner?.member?.name ?? "", username: node.owner?.member?.username ?? "", profileImage: "", imagePath: URL(string: node.owner?.member?.profilePicture?.asImage?.url ?? "")), tagList: []) }
                    continuation.resume(returning: mappedFeed ?? [])
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }) 
    }
}
