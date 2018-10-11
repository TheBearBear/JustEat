//
//  SelectionViewController.swift
//  PickyPick
//
//  Created by Daniel Yen on 10/7/18.
//  Copyright © 2018 Daniel Yen. All rights reserved.
//

import UIKit

class SelectionViewController: UIViewController {
    
    var jsonData: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.cyan
        setupData()
    }
    
    func setupData() {
        guard let data = jsonData else {
            return
        }

        let venueArray = AppHelper.decodeJsonVenues(json: data)
        let places = AppHelper.decodeJsonPlaces(arrayOfVenues: venueArray)
        print(places)
    }
}
