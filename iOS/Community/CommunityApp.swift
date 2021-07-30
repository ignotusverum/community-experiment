//
//  CommunityApp.swift
//  Community
//
//  Created by Vlad Z. on 7/29/21.
//

import SwiftUI

@main
struct CommunityApp: App {
    let store = AppStore(initial: AppState(),
                         middlewares: MiddlewareFactory.allMiddlewares) { state, action in
        debugPrint("[DEBUG] - Reduce\t\t\t", action)
        AppReducer.reduce(state: &state, action: action)
    }

    var body: some Scene {
        WindowGroup {
            ZStack {
                Color
                    .backgroundColor
                    .blur(radius: 20)
                    .edgesIgnoringSafeArea(.all)

                RootView(store: store)
            }
        }
    }
}
