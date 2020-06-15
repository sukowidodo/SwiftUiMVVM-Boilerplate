//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Prashant Gaikwad on 14/06/20.
//  Copyright © 2020 Prashant Gaikwad. All rights reserved.
//

import Foundation

struct Constants {
    static let BASEURL : String = "http://sukowidodo.com:8080"
}

class RequestService {
    
    func httpRequest <T: Codable>(
            endpoint: String,
            parameters: [String: Any],
            completion: @escaping(T?, URLResponse?, Error?) -> Void
        ) {
        guard let url = URL(string : Constants.BASEURL + endpoint) else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
            return
        }
        
        request.httpBody = httpBody
        request.timeoutInterval = 20
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(nil, response, error)
                return
            }
            completion(try? self.newJSONDecoder().decode(T.self, from: data), response, nil)
            
            }.resume()
        
    }
    
    func newJSONDecoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
            decoder.dateDecodingStrategy = .iso8601
        }
        return decoder
    }

    func newJSONEncoder() -> JSONEncoder {
        let encoder = JSONEncoder()
        if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
            encoder.dateEncodingStrategy = .iso8601
        }
        return encoder
    }
    
    func loginPost(parameters:[String : Any], completion: @escaping (ResponseLogin?, URLResponse?, Error?) -> Void) -> Void {
        httpRequest(endpoint: "/auth/login", parameters: parameters, completion: completion)
    }
    
}
