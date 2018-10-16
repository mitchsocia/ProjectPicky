//
//  NetworkCall.swift
//  ProjectPicky
//
//  Created by Mitchell Socia on 10/12/18.
//  Copyright © 2018 Mitchell Socia. All rights reserved.
//

import Foundation

class NetworkCall {

    var placesApi = PlacesApi()
    
    
    func placesURL() -> URL {

        let urlString = "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=pizza%20restaurant&inputtype=textquery&fields=formatted_address,name,opening_hours&locationbias=circle:10000@42.3314,-83.0458&key=\(placesApi.apiKey)"
        let url = URL(string: urlString)
        return url!
    }
    
    func performStoreRequest(with url: URL) -> Data? {
        do {
            print("Success")
            return try Data(contentsOf: url)
        } catch {
        print("Error \(error)")
            return nil
        }
    }
    
    func parse(data: Data) -> PizzaLocations? {
        do {
            let decoder = JSONDecoder()
            let result = try decoder.decode(PizzaLocations.self, from: data)
            print(result.candidates[0].name)
            print(result.candidates[0].formatted_address)
            return result
        } catch {
            print("JSON Error: \(error)")
            return nil
        }
    }
    
}
