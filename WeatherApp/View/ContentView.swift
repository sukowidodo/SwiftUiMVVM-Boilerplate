//
//  ContentView.swift
//  WeatherApp
//
//  Created by Prashant Gaikwad on 14/06/20.
//  Copyright © 2020 Prashant Gaikwad. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var weatherVM: WeatherViewModel
    
    init() {
        self.weatherVM = WeatherViewModel()
    }
    
    var body: some View {
        VStack {
            Text("Weather Report").font(.largeTitle).padding()
            
            TextField("Enter city name...", text: self.$weatherVM.cityName) {
                self.weatherVM.search()
            }
            
            Text("Temp -\(self.weatherVM.temperature)").font(.largeTitle)
            
            Spacer()
            
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
