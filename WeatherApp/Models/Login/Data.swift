//
//  Data.swift
//  sukoapp
//
//  Created by macbook on 6/14/20.
//  Copyright © 2020 SmartCyberSolution. All rights reserved.
//

import Foundation

struct Data : Codable {
    let token : String?
    
    enum CodingKeys: String, CodingKey {
        
        case token = "token"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        token = try values.decodeIfPresent(String.self, forKey: .token)
    }
    
}
