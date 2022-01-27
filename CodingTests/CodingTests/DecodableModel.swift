//
//  DecodableModel.swift
//  CodingTests
//
//  Created by Jageloo Yadav on 27/01/22.
//

import Foundation

enum MyCodingKeys: CodingKey {
    case data
}

protocol Parser {
    func instanciate(container: KeyedDecodingContainer<MyCodingKeys>)
}


struct Model: Decodable {
    
}

extension Model {
    func instanciate(container: KeyedDecodingContainer<MyCodingKeys>) throws -> Decodable {
        return try container.decode(Model.self, forKey: .data)
    }
}

