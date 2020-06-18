//
//  HomeViewModel.swift
//  WeatherApp
//
//  Created by macbook on 6/17/20.
//  Copyright © 2020 Prashant Gaikwad. All rights reserved.
//

import Foundation
import Combine
import KeychainSwift

class HomeViewModel : ObservableObject {
    
    private var api: RequestService
    @Published var products = [Product]()
    @Published var id :String?
       
    init() {
        self.api = RequestService()
    }
    
    func fetchData(){
        self.api.homeGet { (data, response, err ) in
            DispatchQueue.main.async {
                if let data = data {
                    if data.code == 200 {
                        self.products = data.data?.product as! [Product]
                        self.id = data.data?.id
                    }
                }
            }
        }
    }
}
