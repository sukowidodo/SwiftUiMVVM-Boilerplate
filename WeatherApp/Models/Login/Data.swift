//
//  Data.swift
//  sukoapp
//
//  Created by macbook on 6/14/20.
//  Copyright © 2020 SmartCyberSolution. All rights reserved.
//

import Foundation
import Combine

struct Data : Codable {
    let token : String?
    let id : String?
    let product : [Product]?
    
    enum CodingKeys: String, CodingKey {
        case token = "token"
        case id = "id"
        case product = "product"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        token = try values.decodeIfPresent(String.self, forKey: .token)

        id = try values.decodeIfPresent(String.self, forKey: .id)
        product = try values.decodeIfPresent([Product].self, forKey: .product)
    }
    
}
