//
//  CreatePostAction.swift
//  CreatePostAction
//
//  Created by Vlad Z. on 8/1/21.
//

import Foundation

enum CreatePostAction {
    case onPostCreate
    case createPost(title: String, details: String, tags: [String])
    case postCreated(Article) 
    
    case error(Error)
}
