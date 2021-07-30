//
//  ContentView.swift
//  Community
//
//  Created by Vlad Z. on 7/29/21.
//

import SwiftUI

struct RootView: View {
    let store: AppStore

    init(store: AppStore) {
        self.store = store
    }

    var body: some View {
        StoreProvider() {
            FeedListViewConnector()
        }
        .environmentObject(store)
    }
}

