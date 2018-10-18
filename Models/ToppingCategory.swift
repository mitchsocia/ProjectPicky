//
//  File.swift
//  ProjectPicky
//
//  Created by Mitchell Socia on 10/18/18.
//  Copyright © 2018 Mitchell Socia. All rights reserved.
//

import Foundation

class ToppingCategory {
    
    var categoryName: String
    var toppings: [String]
    
    init(categoryName: String, toppings: [String]) {
        self.categoryName = categoryName
        self.toppings = toppings
    }
    
}
