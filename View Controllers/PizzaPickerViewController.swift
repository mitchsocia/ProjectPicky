//
//  PizzaPickerViewController.swift
//  ProjectPicky
//
//  Created by Mitchell Socia on 10/18/18.
//  Copyright © 2018 Mitchell Socia. All rights reserved.
//

import UIKit

class PizzaPickerViewController: UIViewController {
    
    var favoritePizzas: [FavoritePizza] = []
    var favoritePizza = ""
    
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
    
    @IBAction func addToFavoritesButtonPressed(_ sender: UIButton) {
        let pizza = "\(displayPizzaResult.text!), \(displayPizzaResult2.text!)"
        favoritePizza = pizza
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowAddedFavorites" {
            let favoritesViewController = segue.destination as! FavoritesTableViewController
            favoritesViewController.favoritePizzas.append(favoritePizza)
        }
    }
    
}
