//
//  Tags.swift
//  Tags
//
//  Created by Vlad Z. on 7/30/21.
//

import Foundation

struct Tag: Codable {
    let id: Int
    let name: String
    let bgColorHex: String?
    let textColorHex: String?
}
