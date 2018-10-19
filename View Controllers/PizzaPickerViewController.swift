//
//  PizzaPickerViewController.swift
//  ProjectPicky
//
//  Created by Mitchell Socia on 10/18/18.
//  Copyright © 2018 Mitchell Socia. All rights reserved.
//

import UIKit

class PizzaPickerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.displayPizzaResult.text = toppingsChoice.randomElement()
        self.displayPizzaResult2.text = toppingsChoice.randomElement()
    }

    @IBOutlet weak var displayPizzaResult: UILabel!
    
    @IBOutlet weak var displayPizzaResult2: UILabel!
    
    
}
