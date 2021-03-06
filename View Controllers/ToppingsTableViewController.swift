//
//  ToppingsTableViewController.swift
//  ProjectPicky
//
//  Created by Mitchell Socia on 10/17/18.
//  Copyright © 2018 Mitchell Socia. All rights reserved.
//

import UIKit

var toppingsCategories = [
    ToppingCategory(categoryName: "Vegetables", toppings: ["Tomato", "Onion", "Spinach", "Green Olive", "Black Olive", "Mild Pepper", "Green Pepper", "Mushroom", "Jalapeño", "Basil"]),
    ToppingCategory(categoryName: "Meats", toppings: ["Pepperoni", "Ham", "Bacon", "Ground Beef", "Sausage", "Anchovie", "Chicken", "Salami"]),
    ToppingCategory(categoryName: "Misc.", toppings: ["Pineapple", "Pickle", "Garlic"])
]

var toppingsChoice = [String]()

struct Objects {
    
    var sectionName : String!
    var sectionObjects : [String]!
}

class ToppingsTableViewController: UITableViewController {
    
    let SectionHeaderHeight: CGFloat = 50
    var favorites: [FavoritePizza] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = #colorLiteral(red: 1, green: 0.9286860824, blue: 0.3978641629, alpha: 1)
    }
    
    //MARK: TableView Setup
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToppingsItem", for: indexPath)
        let toppingForCell = toppingsCategories[indexPath.section].toppings[indexPath.row]
        cell.textLabel?.text = toppingForCell
        
        
        if toppingsChoice.contains(toppingForCell) {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return toppingsCategories.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return toppingsCategories[section].toppings.count
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return SectionHeaderHeight
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        return toppingsCategories[section].categoryName
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.accessoryType == .none {
                cell.accessoryType = .checkmark
                
                toppingsChoice.append(toppingsCategories[indexPath.section].toppings[indexPath.row])
                
            } else {
                cell.accessoryType = .none
                toppingsChoice.removeAll { (string) -> Bool in
                    string == toppingsCategories[indexPath.section].toppings[indexPath.row]
                }
            }
            
        }
        print(toppingsChoice)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func toppingsPickerButtonPressed(_ sender: UIButton) {
        
    }
    
}
