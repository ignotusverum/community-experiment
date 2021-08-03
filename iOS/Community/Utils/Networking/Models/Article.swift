//
//  Article.swift
//  Article
//
//  Created by Vlad Z. on 6/13/21.
//

import Foundation
import UIKit
import SwiftUI

struct Article: Decodable {
    let id: Int
    let title: String
    let description: String
    let commentsCount: Int
    let positiveReactionsCount: Int
    
    let user: User
    let tagList: [String]
    
    init(id: Int,
         title: String,
         description: String,
         commentsCount: Int,
         positiveReactionsCount: Int,
         user: User,
         tagList: [String]) {
        self.id = id 
        self.title = title 
        self.description = description 
        self.commentsCount = commentsCount 
        self.positiveReactionsCount = positiveReactionsCount 
        self.user = user 
        self.tagList = tagList 
    }
}

extension Article: Hashable { }

struct ArticlePage: Decodable {
    let results: [Article]
}
