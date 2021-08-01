//
//  AccountView.swift
//  AccountView
//
//  Created by Vlad Z. on 7/31/21.
//

import SwiftUI

struct AccountView: View {
    let user: User
    
    var body: some View { 
        NavigationView {
            Text(user.name)
            Text(user.userName)
        }
        .navigationTitle("Account")
    }
}
