//
//  FavoritesTableViewController.swift
//  ProjectPicky
//
//  Created by Mitchell Socia on 10/23/18.
//  Copyright © 2018 Mitchell Socia. All rights reserved.
//

import UIKit

class FavoritesTableViewController: UITableViewController {
    
    var favoritePizzas = [String]()
    
    func pizzaPickerViewController(_ pizzaPickerViewController: PizzaPickerViewController, didAddFavorite favorite: String) {
        favoritePizzas.append(favorite)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(favoritePizzas)
        print("Documents folder is \(documentsDirectory())")
        print("Data file path is \(dataFilePath())")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoritePizzas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteItem", for: indexPath)
        cell.textLabel?.text = favoritePizzas[indexPath.row]
   
        return cell

    }
    
}

//MARK: Data Persistence

extension FavoritesTableViewController {
    
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func dataFilePath() -> URL {
        return documentsDirectory().appendingPathComponent("Favorites.plist")
    }
    
    
    
}
