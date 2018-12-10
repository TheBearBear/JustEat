//
//  PickViewController.swift
//  PickyPick
//
//  Created by Daniel Yen on 11/30/18.
//  Copyright © 2018 Daniel Yen. All rights reserved.
//

import UIKit

class PickViewController: UIViewController {
    
    var pickedPlace: Place?

    let namePlace: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let menuButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.mainRed
        button.setAttributedTitle(AppHelper.attributedText(str: "Menu", fontStyle: Constants.CHALKFONT_BOLD, fontSize: 20, color: UIColor.white), for: .normal)
        button.layer.cornerRadius = 25
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.red.cgColor
        button.addTarget(self, action: #selector(returnToMenu), for: .touchUpInside)
        return button
    }()
    
    let imagePlace: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViewData()
        setUpViews()
    }
    
    func setUpViewData() {
        if let placeName = pickedPlace?.name {
            namePlace.attributedText = AppHelper.attributedText(str: placeName, fontStyle: Constants.CHALKFONT_BOLD, fontSize: 25, color: UIColor.mainRed)
        }
        if let placeImageURL = pickedPlace?.getPhotoUrl() {
            let url = URL(string: placeImageURL)
            imagePlace.load(url: url!)
        }
    }
    
    func setUpViews() {
        view.backgroundColor = UIColor.white
        
        view.addSubview(namePlace)
        view.addSubview(menuButton)
        view.addSubview(imagePlace)
        
        NSLayoutConstraint.activate([
            namePlace.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            namePlace.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            menuButton.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.2),
            menuButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.2),
            menuButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            menuButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            imagePlace.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            imagePlace.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            imagePlace.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.5),
            imagePlace.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor)
            ])
    }
    
    
    @objc func returnToMenu() {
        let homeVC = HomeViewController()
        present(homeVC, animated: true)
    }
}
