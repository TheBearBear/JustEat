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
    
    var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    func setup() {
        addSubview(displayView)
        displayView.addSubview(label)
        
        let constraints = [displayView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
                           displayView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
                           displayView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
                           displayView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
                           
                           label.topAnchor.constraint(equalTo: displayView.topAnchor),
                           label.leadingAnchor.constraint(equalTo: displayView.leadingAnchor),
                           label.bottomAnchor.constraint(equalTo: displayView.bottomAnchor),
                           label.trailingAnchor.constraint(equalTo: displayView.trailingAnchor)
                           ]
        NSLayoutConstraint.activate(constraints)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
