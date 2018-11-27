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
    let buttons = ["Breakfast", "Lunch", "Dinner", "Dessert", "Coffee", "Nightlife"]
    var currentLocation: CLLocation?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    
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
            button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
            button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
            button.layer.shadowOpacity = 1.0
            button.layer.shadowRadius = 0.0
            button.layer.masksToBounds = false
            button.layer.cornerRadius = 10
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
