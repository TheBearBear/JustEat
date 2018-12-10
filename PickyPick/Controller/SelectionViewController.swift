//
//  SelectionViewController.swift
//  PickyPick
//
//  Created by Daniel Yen on 10/7/18.
//  Copyright © 2018 Daniel Yen. All rights reserved.
//

import UIKit

class SelectionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var jsonData: String?
    var placeData: [Place]?
    fileprivate let cellId = "cell"
    
    let tableView: UITableView = {
        let tView = UITableView()
        tView.translatesAutoresizingMaskIntoConstraints = false
        tView.separatorStyle = .none
        return tView
    }()
    
    let pickButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 25
        button.backgroundColor = UIColor.red
        button.setAttributedTitle(AppHelper.attributedText(str: "Pick!", fontStyle: Constants.CHALKFONT_REG, fontSize: 20, color: UIColor.white), for: .normal)
        button.addTarget(self, action: #selector(goToPick), for: .touchUpInside)
        
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        button.layer.shadowOpacity = 1.0
        button.layer.shadowRadius = 0.0
        
        return button
    }()
    
    let menuButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 25
        button.backgroundColor = UIColor.red
        button.setAttributedTitle(AppHelper.attributedText(str: "Menu", fontStyle: Constants.CHALKFONT_REG, fontSize: 20, color: UIColor.white), for: .normal)
        button.addTarget(self, action: #selector(goBackToMenu), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupData()
        setupBackground()
        setUpTableView()
    }
    
    func setupBackground() {
        let blurEffect = UIBlurEffect(style: .regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.frame
        let backgroundImage = UIImage(named: "red")
        let imageView = UIImageView(image: backgroundImage)
        imageView.contentMode = .scaleAspectFill
        imageView.addSubview(blurEffectView)
        view.addSubview(imageView)
    }
    
    func setUpTableView() {
        view.addSubview(tableView)
        view.addSubview(pickButton)
        view.addSubview(menuButton)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            pickButton.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.2),
            pickButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.2),
            pickButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -7),
            pickButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -7),
            
            menuButton.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.2),
            menuButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.2),
            menuButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -7),
            menuButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 7)
            ])
    
        tableView.backgroundColor = UIColor.clear
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(DisplayPlaceCell.self, forCellReuseIdentifier: cellId)
    }
    
    func setupData() {
        guard let data = jsonData else {
            return
        }
        placeData = AppHelper.decodeJsonVenues(json: data)
    }

    @objc func goBackToMenu() {
        let homeVC = HomeViewController()
        self.present(homeVC, animated: true)
    }
    
    @objc func goToPick() {
        if let places = placeData {
            let randomNumber = Int.random(in: 0..<places.count)
            let pickVC = PickViewController()
            pickVC.pickedPlace = places[randomNumber]
            present(pickVC, animated: true)
        } else {
            return
        }
    }
    
    // TABLEVIEW DATA SOURCE
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (placeData?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! DisplayPlaceCell
        let thePlace = placeData![indexPath.row]
        
        cell.nameLabel.attributedText = AppHelper.attributedText(str: thePlace.name!, fontStyle: Constants.CHALKFONT_BOLD, fontSize: 20, color: UIColor.red)
        
        let distanceText = String(AppHelper.metersToMiles(meter: thePlace.distance!)) + " miles away"
        cell.distanceLabel.attributedText = AppHelper.attributedText(str: distanceText, fontStyle: Constants.CHALKFONT_LIGHT, fontSize: 15, color: UIColor.red)
        
        if let address = thePlace.formattedAddress?[0] {
            let addressText = AppHelper.subStrCharacter(str: address, char: ")")
            cell.addressLabel.attributedText = AppHelper.attributedText(str: addressText, fontStyle: Constants.CHALKFONT_REG, fontSize: 17, color: UIColor.red)
        }
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor.clear
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    // TABLEVIEW DATA DELEGATE
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell = tableView.cellForRow(at: indexPath) as! DisplayPlaceCell
        print(selectedCell.nameLabel.text!)
    }
}
