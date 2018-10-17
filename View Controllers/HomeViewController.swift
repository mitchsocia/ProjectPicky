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
    var currentCandidateIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locations = networkCall.parse(data: networkCall.performStoreRequest(with: networkCall.placesURL())!)
        locations?.candidates.first?.name
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    
    @IBOutlet weak var mainIconImage: UIImageView!
    @IBOutlet weak var locationNameLabel: UILabel!
    @IBOutlet weak var locationAddressLabel: UILabel!
    
    @IBAction func displayButtonTapped(_ sender: UIButton) {
        guard let locations = locations else {
            return
            
        }
        if currentCandidateIndex == nil {
            currentCandidateIndex = 0
        } else {
            currentCandidateIndex = (currentCandidateIndex! + 1) % locations.candidates.count
        }
        locationNameLabel.text = locations.candidates[currentCandidateIndex ?? 0].name
        locationAddressLabel.text = locations.candidates[currentCandidateIndex ?? 0].formatted_address
        sender.setTitle("Try Again", for: .normal)
    }
}


