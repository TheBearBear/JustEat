//
//  ViewController.swift
//  PickyPick
//
//  Created by Daniel Yen on 9/8/18.
//  Copyright © 2018 Daniel Yen. All rights reserved.
//

import UIKit
import CoreLocation

class HomeViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager = CLLocationManager()
    let buttons = ["Breakfast", "Lunch", "Dinner", "Dessert", "Coffee", "Nightlife", "Entertainment"]
    var currentLocation: CLLocation?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
//        setupNav()
        setupButtons()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            currentLocation = location
            locationManager.stopUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }
    
//    func setupNav() {
//        self.navigationItem.title = "PickyPick"
//        self.navigationController?.navigationBar.barTintColor = UIColor.white
//        self.navigationController?.navigationBar.isTranslucent = false
//        self.navigationController?.navigationBar.barStyle = .black
//        self.navigationController?.navigationBar.prefersLargeTitles = true
//    }
    
    func setupButtons() {
        var buttonsDisplay = [UIView]()
        
        for i in buttons {
            let button = UIButton(type: .system)
            button.setTitle(i, for: .normal)
            button.setTitleColor(UIColor.white, for: .normal)
            button.backgroundColor = UIColor.mainRed
            button.layer.cornerRadius = 10
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(clicked), for: .touchUpInside)
            buttonsDisplay.append(button)
        }
        
        
        let stackView = UIStackView(arrangedSubviews: buttonsDisplay)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 30
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    @objc func clicked(_ sender: UIButton) {
        let clicked = sender.currentTitle!

        guard let currentLocation = currentLocation else {
            print("no address")
            return
        }
        
        let lat = "\(currentLocation.coordinate.latitude)"
        let long = "\(currentLocation.coordinate.longitude)"
        Request.searchVenues(clicked: clicked, latitude: lat, longitude: long) { response in
            let selectionVC = SelectionViewController()
            selectionVC.jsonData = response!
            self.present(selectionVC, animated: true, completion: nil)
        }
    }
}
