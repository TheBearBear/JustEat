//
//  DisplayPlaceCell.swift
//  PickyPick
//
//  Created by Daniel Yen on 10/15/18.
//  Copyright © 2018 Daniel Yen. All rights reserved.
//

import UIKit

class DisplayPlaceCell: UITableViewCell {

    let displayView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 10
        return view
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var addressStack: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    var distanceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var addressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    func setup() {
        addSubview(displayView)
        displayView.addSubview(nameLabel)
        displayView.addSubview(distanceLabel)
        displayView.addSubview(addressLabel)
        
        NSLayoutConstraint.activate([
            displayView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            displayView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -13),
            displayView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            displayView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 13),
                           
            nameLabel.topAnchor.constraint(equalTo: displayView.topAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: displayView.leadingAnchor, constant: 5),
                           
            addressLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            addressLabel.leadingAnchor.constraint(equalTo: displayView.leadingAnchor, constant: 5),
            
            distanceLabel.bottomAnchor.constraint(equalTo: displayView.bottomAnchor, constant: -6),
            distanceLabel.trailingAnchor.constraint(equalTo: displayView.trailingAnchor, constant: -6)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
