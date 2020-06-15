//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Prashant Gaikwad on 14/06/20.
//  Copyright © 2020 Prashant Gaikwad. All rights reserved.
//

import Foundation
import Combine

class WeatherViewModel: ObservableObject {
    
    @Published var weather = Weather()
    
    private var weatherService: WeatherService!
    
    init() {
        self.weatherService = WeatherService()
    }
    
    var temperature: String {
        if let temp = self.weather.temp {
            return String(format:"%.0f",temp)
        }
        else{
            return ""
        }
    }
    
    var cityName: String = ""
    
    func search() {
        if let city = self.cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            fetchWeather(by: city)
        }
    }
    
    private func fetchWeather(by city: String) {
        
        self.weatherService.getWeather(from: city) { weather in
            
            if let weatherData = weather {
                DispatchQueue.main.async {
                    self.weather = weatherData
                }
            }
        }
        
    }
    
}
