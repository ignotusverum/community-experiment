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
    @State var selectedTag: String = ""
    
    let submitPost: CommandWith<(String, String, String)>
    
    var body: some View { 
        VStack {
            Spacer()
            
            VStack(alignment: .leading,
                   spacing: 15) {
            
                HStack {
                    VStack(alignment: .leading,
                           spacing: 10) {
                        TextField("Title", text: $postTitle)
                            .font(Font.headline.weight(.bold))
                            .fixedSize(horizontal: false,
                                       vertical: true)
                        
                        TextField("Details", text: $postDetails)
                            .font(.body)
                            .frame(minHeight: 45)
                            .foregroundColor(Color.gray.opacity(0.75))
                        
                        HStack {
                            ForEach(GlobalConfig.shared.tags.map(\.name), id: \.self) { tag in 
                                Text(tag)
                                    .font(.caption2)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 8)
                                    .background(tag == selectedTag ? Color.gray.opacity(0.25) : .clear)
                                    .cornerRadius(20)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.gray.opacity(0.25),
                                                    lineWidth: 2)
                                    )
                                    .onTapGesture { 
                                        selectedTag = tag
                                    }
                            }
                        }
                        .padding(.bottom, 10)
                    }
                    Spacer()
                }
                .padding()
                
                HStack {
                    AsyncImage(
                        url: GlobalConfig.shared.user.imagePath,
                        placeholder: { Text("Loading ...") },
                        image: { Image(uiImage: $0).resizable() }
                    )
                        .cornerRadius(15)
                        .frame(width: 35, 
                               height: 35, 
                               alignment: .center)
                    
                    Text(GlobalConfig.shared.user.username)
                        .font(.caption)
                        .foregroundColor(Color.gray.opacity(0.75))
                    
                    Spacer()
                }
                .padding()
            }
                   .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white)
                        .shadow(color: Color.surfaceColor.opacity(0.4),
                                radius: 1,
                                x: 0,
                                y: 1)
                   )
            
            Spacer()
            
            VStack {
                HStack {
                    Spacer()
                    
                    Button(action: {
                        submitPost((postTitle,
                                    postDetails,
                                    selectedTag))
                    }) {
                        Image(systemName: "paperplane.fill")
                            .foregroundColor(.white)
                    }
                    .frame(width: 50,
                           height: 50)
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color.red)
                            .shadow(color: Color.surfaceColor.opacity(0.4),
                                    radius: 1,
                                    x: 0,
                                    y: 1)
                    )
                }
                .padding(.bottom,
                         25)
                .padding(.trailing,
                         7)
            }
        }
        .padding(.horizontal)
    }
}


struct CreatePostFlow: Connector {
    let onSubmitTapped: Command
    @EnvironmentObject var store: AppStore
    
    func map() -> some View {
        CreatePostView(submitPost: store.bind { 
            onSubmitTapped()
            return .createPostFlow(action: .createPost(title: $0.0, details: $0.1, tags: [$0.2])) 
        })
    }
}
