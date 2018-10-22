//
//  PizzaPickerViewController.swift
//  ProjectPicky
//
//  Created by Mitchell Socia on 10/18/18.
//  Copyright © 2018 Mitchell Socia. All rights reserved.
//

import UIKit

class PizzaPickerViewController: UIViewController, HomeViewControllerDelegate {
    func didFinishPassing(controller: HomeViewController, favoritePizzas: [FavoritePizza]) {
        controller.delegate = self
        controller.favorites = favoritePizzas
        print("YO")
    }
    
    var favoritePizzas: [FavoritePizza] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.displayPizzaResult.text = toppingsChoice.randomElement()
        self.displayPizzaResult2.text = toppingsChoice.randomElement()
    }
    
    @IBOutlet weak var displayPizzaResult: UILabel!
    
    @IBOutlet weak var displayPizzaResult2: UILabel!
    
    @IBAction func tryAgainButton(_ sender: UIButton) {
        displayPizzaResult.text = toppingsChoice.randomElement()
        displayPizzaResult2.text = toppingsChoice.randomElement()
        
    }
    
    @IBAction func favoritesButtonPressed(_ sender: UIButton) {
        let pizza = FavoritePizza.init(toppings: [displayPizzaResult.text!, displayPizzaResult2.text!])
        favoritePizzas.append(pizza)
        print(favoritePizzas)
    }

}
