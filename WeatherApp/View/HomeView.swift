//
//  HomeView.swift
//  WeatherApp
//
//  Created by macbook on 6/17/20.
//  Copyright © 2020 Prashant Gaikwad. All rights reserved.
//

import SwiftUI
import Combine

struct HomeView: View {
    
    var body: some View {
        TabView {
            DashboardView()
                .tabItem {
                    Image(systemName:"heart.fill")
                    Text("Favourites")
            }
            Text("Friends Screen")
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Friends")
            }
            Text("Nearby Screen")
                .tabItem {
                    Image(systemName: "mappin.circle.fill")
                    Text("Nearby")
            }
        }
    }
}

struct Result: Identifiable {
    var id = UUID()
    var score: Int
}

struct DashboardView: View {
    @ObservedObject var homeVM : HomeViewModel
    init() {
        self.homeVM = HomeViewModel()
        self.homeVM.fetchData()
    }
    
    var body: some View {
        VStack {
            Text("Hello Suko, your id is \(homeVM.id ?? "")").bold()
            Text("Your product is :")
            ForEach(homeVM.products){ items in
                Text("\(items.name ?? "")")
            }
        }
    }
    
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
