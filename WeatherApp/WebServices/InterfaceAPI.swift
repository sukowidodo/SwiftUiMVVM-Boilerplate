//
//  InterfaceAPI.swift
//  WeatherApp
//
//  Created by macbook on 6/16/20.
//  Copyright © 2020 Prashant Gaikwad. All rights reserved.
//

import Foundation

class InterfaceAPI {
    func loginPost(with path: String, parameters:[String : Any], completion: @escaping (ResponseLogin?, URLResponse?, Error?) -> Void) -> Void {
        RequestService.httpRequest(with: "/auth/login", parameters: parameters, completion: completion)
    }
}
