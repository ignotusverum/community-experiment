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
    
    var imagePath: URL? {
        URL(string: "http://localhost:3000\(profileImage)")
    }
}
