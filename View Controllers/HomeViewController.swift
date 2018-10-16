//
//  ViewController.swift
//  ProjectPicky
//
//  Created by Mitchell Socia on 10/9/18.
//  Copyright © 2018 Mitchell Socia. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var networkCall = NetworkCall()
    var locations: PizzaLocations?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locations = networkCall.parse(data: networkCall.performStoreRequest(with: networkCall.placesURL())!)
        locations?.candidates.first?.name
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    
    @IBOutlet weak var mainIconImage: UIImageView!
    @IBOutlet weak var locationNameLabel: UILabel!
    @IBOutlet weak var locationAddressLabel: UILabel!
    
    @IBAction func displayButtonTapped(_ sender: Any) {
        locationNameLabel.text = locations?.candidates.first?.name
        locationAddressLabel.text = locations?.candidates.first?.formatted_address
    }
}

