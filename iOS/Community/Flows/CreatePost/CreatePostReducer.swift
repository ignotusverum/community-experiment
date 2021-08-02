//
//  CreatePostReducer.swift
//  CreatePostReducer
//
//  Created by Vlad Z. on 8/1/21.
//

import Foundation

func createPostReducer(state: inout CreatePostState,
                       action: CreatePostAction) {
    switch action {
    case .onPostCreate:
        state = .create
    default: break
    }
}
