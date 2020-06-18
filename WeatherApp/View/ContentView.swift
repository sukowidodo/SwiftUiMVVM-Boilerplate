//
//  ContentView.swift
//  WeatherApp
//
//  Created by Prashant Gaikwad on 14/06/20.
//  Copyright © 2020 Prashant Gaikwad. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var signInSuccessx = false
    var body: some View {
        return Group {
            if signInSuccessx {
                HomeView()
            } else {
                LoginView(signInSuccess:$signInSuccessx)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
