//
//  ResponseLogin.swift
//  sukoapp
//
//  Created by macbook on 6/12/20.
//  Copyright © 2020 SmartCyberSolution. All rights reserved.
//

import Foundation

struct ResponseLogin : Codable {
    let code : Int?
    let message : String?
    let data : Data?
    
    enum CodingKeys: String, CodingKey {
        
        case code = "code"
        case message = "message"
        case data = "data"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decodeIfPresent(Int.self, forKey: .code)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent(Data.self, forKey: .data)
    }
    
}
