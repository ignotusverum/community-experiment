//
//  CreatePostMiddleware.swift
//  CreatePostMiddleware
//
//  Created by Vlad Z. on 8/1/21.
//


class CreatePostMiddleware: MiddlewareProcessing {
    class func handler() -> Middleware<AppState, AppAction> {
        return { state, action, dispatch in
            switch action {
            case let .createPostFlow(action):
                switch action {
                case let .createPost(title, details, tags):
                    createPost(title: title, details: details, tags: tags, dispatch: dispatch)
                default: break
                }
            default: break
            }
        }
    }
    
    private class func createPost(title: String,
                                  details: String,
                                  tags: [String],
                                  dispatch: @escaping Dispatcher<AppAction>) {
        Task.init { 
            let article = try await ArticlesAdapter.create(title: title, body: details, tags: tags)
            dispatch(.createPostFlow(action: .postCreated(article)))
        }
    }

    private class func fetchFeed(dispatch: @escaping Dispatcher<AppAction>) {
        Task.init { 
            let articles = try await ArticlesAdapter.fetchLatest()
            dispatch(.feedListFlow(action: .fetched(articles)))
        }
    }
}
