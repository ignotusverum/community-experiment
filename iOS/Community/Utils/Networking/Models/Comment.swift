//
//  Comment.swift
//  Comment
//
//  Created by Vlad Z. on 7/30/21.
//

import Foundation

class Comment: Codable {
    let idCode: String
    let bodyHtml: String
    let cretedAt: Date
    let user: User
    let children: [Comment]?
}
