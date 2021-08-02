//
//  ArticleCard.swift
//  BetterUp
//
//  Created by Vlad Z. on 3/16/21.
//

import SwiftUI

struct ArticleCard: View {
    let article: Article
    
    var body: some View {
        VStack(alignment: .leading,
               spacing: 15) {
            
            HStack {
                VStack(alignment: .leading,
                       spacing: 10) {
                    Text(article.title)
                        .font(Font.headline.weight(.bold))
                        .fixedSize(horizontal: false,
                                   vertical: true)
                    
                    Text(article.description)
                        .font(.body)
                        .frame(minHeight: 45)
                        .foregroundColor(Color.gray.opacity(0.75))
                }
                Spacer()
            }
            .padding()
            
            HStack {
                AsyncImage(
                    url: article.user.imagePath,
                    placeholder: { Text("Loading ...") },
                    image: { Image(uiImage: $0).resizable() }
                )
                    .cornerRadius(15)
                    .frame(width: 35, 
                           height: 35, 
                           alignment: .center)
                
                Text(article.user.username)
                    .font(.caption)
                    .foregroundColor(Color.gray.opacity(0.75))
                
                Spacer()
                
                HStack {
                    Image(systemName: article.positiveReactionsCount > 0 ? "heart.fill" : "heart")
                        .resizable()
                        .frame(width: 15, height: 15, alignment: .center)
                        .foregroundColor(.red)
                    
                    Text("\(article.positiveReactionsCount)")
                        .font(.caption)
                        .foregroundColor(Color.gray.opacity(0.75))
                }
                
                HStack {
                    Image(systemName: article.commentsCount > 0 ? "bubble.right.fill" : "bubble.right")
                        .resizable()
                        .frame(width: 15, height: 15, alignment: .center)
                        .foregroundColor(.gray)
                    
                    Text("\(article.commentsCount)")
                        .font(.caption)
                        .foregroundColor(Color.gray.opacity(0.75))
                }
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
