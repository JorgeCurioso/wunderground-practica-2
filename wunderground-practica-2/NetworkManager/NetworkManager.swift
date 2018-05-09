//
//  NetworkManager.swift
//  wunderground-practica-2
//
//  Created by George Royce on 5/9/18.
//  Copyright © 2018 George Royce. All rights reserved.
//

import Foundation

class NetworkManager {
    
    /// Fetches data for a given URL with the default URLSessionConfiguration
    ///
    /// - Parameters:
    ///   - url: url from which to retrieve data
    ///   - completion: response data
    class func getDataFor(url: URL, completion: (Data) -> ()) {
        
        let request = URLRequest(url: url)
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: request) { (data, response, error) in
            
            guard error == nil else {
                print("NetworkManager error: \(error.debugDescription)")
                return
            }
            
        }.resume()
    }
    
}
