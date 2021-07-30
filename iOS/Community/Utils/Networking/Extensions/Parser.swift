//
//  Parser.swift
//  Community
//
//  Created by Vlad Z. on 6/13/21.
//

import Foundation

extension JSONDecoder {
    static let defaultDecoder: JSONDecoder = {
        let decoder = JSONDecoder()

        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .formatted(.yearMonthDay)
        return decoder
    }()
}

extension Data {
    func map<T>(to: T.Type) throws -> T where T: Decodable {

        try JSONDecoder.defaultDecoder.decode(T.self,
                                              from: self)
    }
}

extension DateFormatter {
    static let yearMonthDay: DateFormatter = {
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter
    }()
}
