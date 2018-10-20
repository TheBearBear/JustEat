//
//  DisplayPlaceCell.swift
//  PickyPick
//
//  Created by Daniel Yen on 10/15/18.
//  Copyright © 2018 Daniel Yen. All rights reserved.
//

import UIKit

class DisplayPlaceCell: UITableViewCell {

    let displayView = UIView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    func setup() {
        addSubview(displayView)
        
        displayView.translatesAutoresizingMaskIntoConstraints = false
        displayView.backgroundColor = UIColor.white
        displayView.layer.cornerRadius = 10
        
        let constraints = [displayView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
                           displayView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
                           displayView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
                           displayView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)]
        NSLayoutConstraint.activate(constraints)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
