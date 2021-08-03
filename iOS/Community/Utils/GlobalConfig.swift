//
//  GlobalConfig.swift
//  GlobalConfig
//
//  Created by Vlad Z. on 8/1/21.
//

import Foundation

class GlobalConfig {
    static let shared = GlobalConfig()
    
    var environment: EnvironmentType = .forem
    
    var user: User!
    var tags: [Tag]!
}

enum EnvironmentType: String {
    case forem
    case tribe
}
