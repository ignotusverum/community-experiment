//
//  User.swift
//  User
//
//  Created by Vlad Z. on 7/30/21.
//

import Foundation

struct User: Codable, Hashable {
    let name: String
    let username: String
    let profileImage: String
    
    let imagePath: URL?
    
    init(name: String,
         username: String,
         profileImage: String,
         imagePath: URL? = nil) {
        self.name = name
        self.username = username
        self.profileImage = profileImage
        self.imagePath = imagePath ?? URL(string: "http://localhost:3000\(profileImage)")
    }
}
