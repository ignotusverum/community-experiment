//
//  FeedListView.swift
//  BetterUp
//
//  Created by Vlad Z. on 3/16/21.
//

import SwiftUI
import Combine

struct FeedListView: View {
    let onCreateTapped: Command
    let reloadAndFilterByFavorite: Command
    let onLinkTapped: CommandWith<URL>
    let articles: [Article]
    
    @State private var isActicleCreationPresented = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .bottom) {
                ScrollView {
                    Color
                        .clear
                        .padding(.top, 10)
                    
                    LazyVStack() {
                        ForEach(articles,
                                id: \.self) { row in
                            ArticleCard(article: row)
                                .onTapGesture {
                                    print("comment tapped")
                                }
                                .frame(width: geo.size.width)
                        }
                    }
                    
                    Color
                        .clear
                        .padding(.bottom,
                                 60)
                }
                
                HStack {
                    Spacer()
                    
                    Button(action: {
                        isActicleCreationPresented.toggle()
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.white)
                    }
                    .frame(width: 50,
                           height: 50)
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color.blue)
                            .shadow(color: Color.surfaceColor.opacity(0.4),
                                    radius: 1,
                                    x: 0,
                                    y: 1)
                    )
                }
                .padding(25)
            }
            .popup(isPresented: isActicleCreationPresented, 
                   alignment: .center, 
                   content: { 
                ZStack {
                    Color
                        .black
                        .opacity(0.35)
                        .blur(radius: 20)
                        .onTapGesture {
                            isActicleCreationPresented.toggle()
                        }
                    
                    CreatePostFlow()
                        .frame(width: geo.size.width, 
                               alignment: .center)
                        .cornerRadius(25)
                        .animation(.easeInOut)
                }
            },
                   onDismiss: { isActicleCreationPresented.toggle() })
        }
        
        .background(Color.backgroundColor)
        .padding(.top, 1)
        .onAppear(perform: {
            reloadAndFilterByFavorite()
        })
    }
}

struct FeedListViewConnector: Connector {
    @EnvironmentObject var store: AppStore
    
    func map() -> some View {
        var articles: [Article] = []
        switch store.state.feedFlowState {
        case let .feedFetched(fetchedArticles):
            articles = fetchedArticles
        default: break
        }
        
        return FeedListView(onCreateTapped: store.bind { .createPostFlow(action: .onPostCreate) }, 
                            reloadAndFilterByFavorite: store.bind { .feedListFlow(action: .reload) },
                            onLinkTapped: store.bind({ .feedListFlow(action: FeedListAction.openLink(url: $0)) }),
                            articles: articles)
    }
}
