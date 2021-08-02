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
               .padding(.vertical,
                        5)
               .padding(.horizontal)
        
    }
}


struct CreatePostFlow: Connector {
    func map() -> some View {
        CreatePostView { 
            print("Action yo")
        }
    }
}
