//
//  PizzaPickerViewController.swift
//  ProjectPicky
//
//  Created by Mitchell Socia on 10/18/18.
//  Copyright © 2018 Mitchell Socia. All rights reserved.
//

import UIKit

protocol PizzaPickerViewControllerDelegate: class {
    func pizzaPickerViewControllerDelegate(_ controller: PizzaPickerViewController, didFinishAdding item: String)
}

class PizzaPickerViewController: UIViewController {
    
    var favoritePizzas: [FavoritePizza] = []
    var favoritePizza = ""
    
//    weak var delegate: PizzaPickerViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPizzas()
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
        let pizzaToppings = "\(displayPizzaResult.text!), \(displayPizzaResult2.text!)"
        let favorite = FavoritePizza(toppings: pizzaToppings)
        favoritePizzas.append(favorite)
        savePizzas()
//        delegate?.pizzaPickerViewControllerDelegate(self, didFinishAdding: favoritePizza)

    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "ShowAddedFavorites" {
//            let favoritesViewController = segue.destination as! FavoritesTableViewController
//        }
//    }
    
}

//MARK: Data Persistence

extension PizzaPickerViewController {
    
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func dataFilePath() -> URL {
        return documentsDirectory().appendingPathComponent("Favorites.plist")
    }
    
    func savePizzas() {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(favoritePizzas)
            try data.write(to: dataFilePath(), options: Data.WritingOptions.atomic)
        } catch {
            print("Error encoding item array")
        }
    }
    
    func loadPizzas() {
        let path = dataFilePath()
        if let data = try? Data(contentsOf: path) {
            let decoder = PropertyListDecoder()
            do {
                favoritePizzas = try decoder.decode([FavoritePizza].self, from: data)
            } catch {
                print("Error decoding item array")
            }
        }
    }
    
    
}
