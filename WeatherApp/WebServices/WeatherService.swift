//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Prashant Gaikwad on 14/06/20.
//  Copyright © 2020 Prashant Gaikwad. All rights reserved.
//

import Foundation

class WeatherService {
    
    func getWeather(from city:String, completion: @escaping (Weather?) -> ()) {
        
        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=006b4227e4aeaa63da5dc8aa2bd56e01&units=imperial") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let responseData = try? JSONDecoder().decode(WeatherResponse.self,from:data)
            if let weatherResponse = responseData {
                let weather = weatherResponse.main
                completion(weather)
            }else{
                completion(nil)
            }
        }.resume()
        
    }
    
}
