//
//  SelectionViewController.swift
//  PickyPick
//
//  Created by Daniel Yen on 10/7/18.
//  Copyright © 2018 Daniel Yen. All rights reserved.
//

import UIKit
import GooglePlaces

class SelectionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var jsonData: String? = nil
//    let placeTemp = Place(name: name, latitude: lat, longitude: lng, phone: phone, formattedAddress: address, price: price, rating: rating, ratingColor: ratingColor, hours: hours, photoPrefix: prefix, photoSuffix: suffix, photoWidth: width, photoHeight: height)
    
    fileprivate let cellId = "cell"
    
    let tableView : UITableView = {
        let tView = UITableView()
        tView.translatesAutoresizingMaskIntoConstraints = false
        return tView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        setupData()
        
        setupBackground()
        setUpTableView()
    }
    
    func setupBackground() {
        let blurEffect = UIBlurEffect(style: .regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.frame
        let backgroundImage = UIImage(named: "bg")
        let imageView = UIImageView(image: backgroundImage)
        imageView.contentMode = .scaleAspectFill
        imageView.addSubview(blurEffectView)
        view.addSubview(imageView)
    }
    
    func setUpTableView() {
        self.view.addSubview(tableView)
        
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        tableView.backgroundColor = UIColor.clear
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(DisplayPlaceCell.self, forCellReuseIdentifier: cellId)
    }
    
    func setupData() {
        guard let data = jsonData else {
            return
        }
        
        let venueArray = AppHelper.decodeJsonVenues(json: data)
        print(venueArray)
//        for venueId in venueArray {
//            Request.searchVenueDetails(venueId: venueArray[7]) { response in
//                let place = AppHelper.decodeJsonPlaces(json: response!)
//                print(place)
//            }
//        }
    }
    
    // TableView Data Source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! DisplayPlaceCell
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    // TableView Data Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
