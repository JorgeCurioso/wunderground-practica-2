//
//  CurrentWeatherConditions.swift
//  wunderground-practica-2
//
//  Created by George Royce on 5/9/18.
//  Copyright © 2018 George Royce. All rights reserved.
//

import Foundation

struct CurrentWeatherConditions {
    
    let degreesFahrenheit: Float
    
    init(_ raw: RawCurrentWeatherConditions) {
        degreesFahrenheit = raw.temp_f
    }
    
}

struct RawCurrentWeatherConditions: Codable {
    
    let temp_f: Float
    
}
