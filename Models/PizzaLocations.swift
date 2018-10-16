//
//  PizzaLocations.swift
//  ProjectPicky
//
//  Created by Mitchell Socia on 10/12/18.
//  Copyright © 2018 Mitchell Socia. All rights reserved.
//

import Foundation

struct PizzaLocations: Codable {
    
    var candidates: [LocationInformation]
    
    struct LocationInformation: Codable {
        var formatted_address: String
        var name: String
//        var vicinity: Double
        
    }
}
