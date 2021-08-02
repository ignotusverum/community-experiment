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
}

extension Article: Hashable { }

struct ArticlePage: Decodable {
    let results: [Article]
}
