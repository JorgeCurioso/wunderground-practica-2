//
//  WeatherService.swift
//  wunderground-practica-2
//
//  Created by George Royce on 5/9/18.
//  Copyright © 2018 George Royce. All rights reserved.
//

import Foundation

class WeatherService {
    
    private let weatherUndergroundKey = ""
    private let weatherUndergroundScheme = "http"
    private let weatherUndergroundHost = "api.wunderground.com"
    
    func getCurrentConditions(completion: () -> Void) {
        
        var components = URLComponents()
        components.scheme = weatherUndergroundScheme
        components.host = weatherUndergroundHost
        components.path = "/api/\(weatherUndergroundKey)/conditions/q/42.3314,-83.0458.json"
        
        guard let url = components.url else {
            print("could not create url for current conditions")
            return
        }
        
        NetworkManager.getDataFor(url: url) { (data) in
            
        }
    }
}
