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
    
    func getCurrentConditions(completion: @escaping (CurrentWeatherConditions) -> Void) {
        
        guard let url = urlForCurrentConditions() else {
            print("could not create url for current conditions")
            return
        }
        
        NetworkManager.getDataFor(url: url) { (data) in
            do {
                let currentConditions = try self.parseCurrentConditionsFrom(data)
                completion(currentConditions)
                
            } catch {
                print("could not parse response into current conditions models: \(error)")
            }
        }
    }
    
    private func urlForCurrentConditions() -> URL? {
        var components = URLComponents()
        components.scheme = weatherUndergroundScheme
        components.host = weatherUndergroundHost
        components.path = "/api/\(weatherUndergroundKey)/conditions/q/42.3314,-83.0458.json"
        
        return components.url
    }
    
    private func parseCurrentConditionsFrom(_ data: Data) throws -> CurrentWeatherConditions {
        let rawWeatherInfo = try JSONDecoder().decode(IntermediateRawCurrentConditions.self, from: data)
        let rawCurrentConditions = rawWeatherInfo.current_observation
        let currentConditions = CurrentWeatherConditions(rawCurrentConditions)
        
        return currentConditions
    }
}

private struct IntermediateRawCurrentConditions: Codable {
    let current_observation:  RawCurrentWeatherConditions
}




