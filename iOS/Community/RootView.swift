//
//  ContentView.swift
//  Community
//
//  Created by Vlad Z. on 7/29/21.
//

import SwiftUI

struct RootView: View {
    let store: AppStore
    
    @State var env: EnvironmentType = GlobalConfig.shared.environment
    @State var shouldProceed: Bool = false
    
    init(store: AppStore) {
        self.store = store
    }
    
    var body: some View {
        if shouldProceed {
            StoreProvider() {
                FeedListViewConnector()
            }
            .environmentObject(store)
        } else {
            VStack {
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(env == .tribe ? .blue : .white)
                            .frame(width: 100, height: 100, alignment: .center)
                            .padding()
                        VStack {
                            Text("Tribe")
                                .padding()
                            
                            if env == .tribe {
                                Image(systemName: "checkmark")
                            }
                        }
                    }
                    .onTapGesture {
                        withAnimation { 
                            env = .tribe
                            GlobalConfig.shared.environment = .tribe
                        }
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(env == .forem ? .blue : .white)
                            .frame(width: 100, height: 100, alignment: .center)
                            .padding()
                        VStack {
                            Text("Forem")
                                .padding()
                            
                            if env == .forem {
                                Image(systemName: "checkmark")
                            }
                        }
                    }
                    .onTapGesture {
                        withAnimation { 
                            env = .forem
                            GlobalConfig.shared.environment = .forem
                        }
                    }
                }

                
                Button("Continue") { 
                    shouldProceed.toggle()
                }
                .background(Color.blue)
                .buttonStyle(.borderedProminent)
            }
        }
    }
}

