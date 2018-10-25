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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPizzas()
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
    
    private func swipeToDelete(indexPath: IndexPath) {
        favoritePizzas.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            swipeToDelete(indexPath: indexPath)
            
        }
        savePizzas()
    }
    
    
}
