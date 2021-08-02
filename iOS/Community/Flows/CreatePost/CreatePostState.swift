//
//  CreatePostState.swift
//  CreatePostState
//
//  Created by Vlad Z. on 8/1/21.
//

import Foundation

enum CreatePostState {
    case initial
    case created(Article)
    case create

    init() { self = .initial }
}
