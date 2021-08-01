//
//  CreatePostView.swift
//  CreatePostView
//
//  Created by Vlad Z. on 7/31/21.
//

import SwiftUI

struct CreatePostView: View {
    @State var postTitle: String = ""
    @State var postDetails: String = ""
    
    var createPostAction: Command
    
    var body: some View { 
        NavigationView {
            Form {
                TextField("Title", text: $postTitle)
                TextField("Post", text: $postDetails)
            }
            
            Button("Create") { 
                print("Create yo")
            }
        }
        .navigationTitle("Create Post")
    }
}

struct CreatePostFlow: Connector {
    func map() -> some View {
        CreatePostView { 
            print("Action yo")
        }
    }
}
