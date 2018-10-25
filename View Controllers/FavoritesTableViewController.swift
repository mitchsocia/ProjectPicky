//
//  FavoritesTableViewController.swift
//  ProjectPicky
//
//  Created by Mitchell Socia on 10/23/18.
//  Copyright © 2018 Mitchell Socia. All rights reserved.
//

import UIKit

class FavoritesTableViewController: UITableViewController {
    
    var favoritePizzas = [FavoritePizza]()
    
    //    func pizzaPickerViewController(_ pizzaPickerViewController: PizzaPickerViewController, didAddFavorite favorite: String) {
    //        favoritePizzas.append(favorite)
    //    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPizzas()
        print("HELLLLOOOOO")
        //        print("Documents folder is \(documentsDirectory())")
        //        print("Data file path is \(dataFilePath())")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoritePizzas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteItem", for: indexPath)
        cell.textLabel?.text = favoritePizzas[indexPath.row].toppings
        
        return cell
        
    }
    
}

extension FavoritesTableViewController {
    
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func dataFilePath() -> URL {
        //        print(documentsDirectory().appendingPathComponent("Favorites.plist"))
        return documentsDirectory().appendingPathComponent("Favorites.plist")
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
