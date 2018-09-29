//
//  ViewController.swift
//  JustEat
//
//  Created by Daniel Yen on 9/8/18.
//  Copyright © 2018 Daniel Yen. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let icon: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "mealIcon")
        imageView.image = image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Start", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.red
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupNav()
        setup()
//        view.backgroundColor = UIColor(red: 243/233, green: 71/255, blue: 66/255, alpha: 1.0)
    }
    
    func setupNav() {
        self.navigationItem.title = "PickyPick"
        
//        let navLabel = UILabel()
//        let navTitle = NSMutableAttributedString(string: "Picky", attributes:[
//            NSAttributedStringKey.foregroundColor: UIColor.white,
//            NSAttributedStringKey.font: UIFont.systemFont(ofSize: 40, weight: UIFont.Weight.light)])
//
//        navTitle.append(NSMutableAttributedString(string: "Pick", attributes:[
//            NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 40),
//            NSAttributedStringKey.foregroundColor: UIColor(red: 244/255, green: 244/255, blue: 34/255, alpha: 1)]))
//
//        navLabel.attributedText = navTitle
//        self.navigationItem.titleView = navLabel
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 243/233, green: 71/255, blue: 66/255, alpha: 1.0)
//        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barStyle = .black
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setup() {
        view.addSubview(icon)
        view.addSubview(startButton)
        
        icon.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        icon.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        
        startButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        startButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        startButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

    }
}
