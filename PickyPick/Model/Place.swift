//
//  Place.swift
//  PickyPick
//
//  Created by Daniel Yen on 10/7/18.
//  Copyright © 2018 Daniel Yen. All rights reserved.
//

import Foundation

struct Place {
    let name: String?
    let latitude: Float?
    let longitude: Float?
    let phone: String?
    let formattedAddress: [String]?
    let price: String?
    let rating: Float?
    let ratingColor: String?
    let hours: String?
    let photoPrefix: String?
    let photoSuffix: String?
    let photoWidth: Int?
    let photoHeight: Int?
    
    func getPhotoUrl() -> String? {
        guard let pP = photoPrefix, let pW = photoWidth, let pH = photoHeight, let pS = photoSuffix else {
            return nil
        }
        return "\(pP)\(pW)x\(pH)\(pS)"
    }
    
    func getFullAddress() -> String {
        var returnStr = ""
        guard let array = formattedAddress else {
            return returnStr
        }
        for str in array {
            returnStr += "\(str) "
        }
        return returnStr
    }
}
