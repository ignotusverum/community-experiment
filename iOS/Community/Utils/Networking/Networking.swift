//
//  Networking.swift
//  Community
//
//  Created by Vlad Z. on 6/13/21.
//

import Foundation

class Networking {
    static let shared = Networking()
    
    func request(with config: RequestConfig) async throws -> Data {
        let request = configureURLRequest(with: config)
        let (data, response) = try await URLSession.shared.data(for: request)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw ApiErrorType.serverError }
        return data
    }
    
    private func configureURLRequest(with config: RequestConfig) -> URLRequest {
        var components = URLComponents()
        components.scheme = "http"
        components.host = config.base
        components.port = 3000
        
        var pathItems: [String] = []
        pathItems.append("api")
        pathItems.append(config.path)
        components.queryItems = config.queryItems

        let cleanedPath = pathItems
            .filter { !$0.isEmpty }
            .joined(separator: "/")

        components.path = "/\(cleanedPath)"
        
        var request = URLRequest(url: components.url!)
        request.setValue("8rdqwKpxtvKSKppoeMirmZC4", 
                         forHTTPHeaderField: "api-key")
        
        if let parameters = config.params {
            request.httpBody = try? JSONSerialization.data(withJSONObject: parameters,
                                                           options: .sortedKeys)
             
            if request.value(forHTTPHeaderField: "Content-Type") == nil {
                request.setValue("application/json",
                                 forHTTPHeaderField: "Content-Type")
            }
        }
        
        request.httpMethod = config.type.rawValue
        
        return request
    }
}

enum RequestType: String {
    case get = "GET"
    case post = "POST" 
    case put = "PUT"
    case delete = "DELETE"
}

struct RequestConfig {
    var path: String
    var queryItems: [URLQueryItem]?
    var params: [String: Any]?
    var base: String = "localhost"
    var type: RequestType = .get
}
