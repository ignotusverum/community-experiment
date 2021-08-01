//
//  PostDetailView.swift
//  PostDetailView
//
//  Created by Vlad Z. on 7/31/21.
//

import SwiftUI

struct PostDetailView: View {
    let post: Article
    
    var body: some View {
        VStack {
            Text(post.title)
            HStack {
                Text("\(post.positiveReactionsCount)")
                Text("\(post.commentsCount)")
            }
            Text(post.description)
        }
    }
}
