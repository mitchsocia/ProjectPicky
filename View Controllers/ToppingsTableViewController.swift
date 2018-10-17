//
//  ToppingsTableViewController.swift
//  ProjectPicky
//
//  Created by Mitchell Socia on 10/17/18.
//  Copyright © 2018 Mitchell Socia. All rights reserved.
//

import UIKit

var toppings = ["Vegetables": ["Tomato", "Onion", "Spinach", "Green Olive", "Black Olive", "Mild Pepper", "Green Pepper", "Mushroom"], "Meats": ["Pepperoni", "Ham", "Bacon", "Sausage", "Anchovie", "Chicken"], "Misc.": ["Pineapple", "Pickle"]]

struct Objects {
    
    var sectionName : String!
    var sectionObjects : [String]!
}

class ToppingsTableViewController: UITableViewController {
    
    var objectArray = [Objects]()
    let SectionHeaderHeight: CGFloat = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = #colorLiteral(red: 1, green: 0.9286860824, blue: 0.3978641629, alpha: 1)
        
        for (key, value) in toppings {
            print("\(key) -> \(value)")
            objectArray.append(Objects(sectionName: key, sectionObjects: value))
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToppingsItem", for: indexPath)
        cell.textLabel?.text = objectArray[indexPath.section].sectionObjects[indexPath.row]
        
        cell.contentView.backgroundColor = #colorLiteral(red: 1, green: 0.9286860824, blue: 0.3978641629, alpha: 1)
        
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return objectArray.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectArray[section].sectionObjects.count
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return SectionHeaderHeight
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return objectArray[section].sectionName
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.accessoryType == .none {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
