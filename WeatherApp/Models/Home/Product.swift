//
//  Product.swift
//  WeatherApp
//
//  Created by macbook on 6/17/20.
//  Copyright © 2020 Prashant Gaikwad. All rights reserved.
//

import Foundation
import Combine

struct Product : Hashable, Codable, Identifiable {
    var id = UUID()
    
    var productid : Int?
    var name : String?
    var price : Int?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case productid = "productid"
        case name = "name"
        case price = "price"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        productid = try values.decodeIfPresent(Int.self, forKey: .productid)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        price = try values.decodeIfPresent(Int.self, forKey: .price)
    }

}

