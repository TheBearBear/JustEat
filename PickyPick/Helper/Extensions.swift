//
//  constraints.swift
//  JustEat
//
//  Created by Daniel Yen on 9/9/18.
//  Copyright © 2018 Daniel Yen. All rights reserved.
//

import UIKit

extension UIColor {
    static var mainRed = UIColor(red: 243/233, green: 71/255, blue: 66/255, alpha: 1.0)
    static var displayColor = UIColor(red: 255/255, green: 251/255, blue: 216/255, alpha: 1.0)
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
