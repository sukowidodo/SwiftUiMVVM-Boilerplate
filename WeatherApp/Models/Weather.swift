//
//  Weather.swift
//  WeatherApp
//
//  Created by Prashant Gaikwad on 14/06/20.
//  Copyright © 2020 Prashant Gaikwad. All rights reserved.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
}

struct Weather: Decodable {
    var temp: Double?
}
