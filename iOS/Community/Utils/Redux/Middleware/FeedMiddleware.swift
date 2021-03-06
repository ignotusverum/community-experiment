//
//  FeedMiddleware.swift
//  BetterUp
//
//  Created by Vlad Z. on 3/16/21.
//

import Foundation
import Combine

class FeedMiddleware: MiddlewareProcessing {
    class func handler() -> Middleware<AppState, AppAction> {
        return { state, action, dispatch in
            switch action {
            case let .feedListFlow(action):
                switch action {
                case .reload:
                    fetchFeed(dispatch: dispatch)
                default: break
                }
            default: break
            }
        }
    }

    private class func fetchFeed(dispatch: @escaping Dispatcher<AppAction>) {
        Task.init { 
            switch GlobalConfig.shared.environment {
            case .tribe:
                let articles = try await ArticlesGraphQLAdapter.fetchLatest()
                dispatch(.feedListFlow(action: .fetched(articles)))
            case .forem:
                let articles = try await ArticlesAdapter.fetchLatest()
                dispatch(.feedListFlow(action: .fetched(articles)))
            }
        }
    }
}
