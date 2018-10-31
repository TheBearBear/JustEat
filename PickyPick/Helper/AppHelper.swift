//
//  AppHelper.swift
//  PickyPick
//
//  Created by Daniel Yen on 10/4/18.
//  Copyright © 2018 Daniel Yen. All rights reserved.
//

import Foundation
import SwiftyJSON

class AppHelper {
    
    static func getTodayDate() -> String {
        let todayDate:Date = Date()
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        let todayString:String = dateFormatter.string(from: todayDate)
        return todayString
    }
    
    static func metersToMiles(meter: Int) -> Float {
        return Float(meter) * 0.000621371
    }
    
    static func decodeJsonVenues(json: String) -> [Place] {
        var places = [Place]()
//        guard let venuesJson = json.data(using: .utf8) else {
//            return venues
//        }
        
//        print(json)
        if let dataFromString = json.data(using: .utf8, allowLossyConversion: false) {
            let json = try? JSON(data: dataFromString)

            let foundVenues = json!["response"]["group"]["results"].array
            for venue in foundVenues! {
                let venueStart = venue["venue"]
                let id = venueStart["id"].stringValue
                let name = venueStart["name"].stringValue
                
                let lat = venueStart["location"]["lat"].floatValue
                let lng = venueStart["location"]["lng"].floatValue
                
                var address = [String]()
                let addressArray = venueStart["location"]["formattedAddress"].array
                let distance = venueStart["location"]["distance"].intValue
                for anAddress in addressArray! {
                    address.append(anAddress.stringValue)
                }
                
                let pathPhoto = venueStart["photo"]
                let prefix = pathPhoto["prefix"].stringValue
                let suffix = pathPhoto["suffix"].stringValue
                let width = pathPhoto["suffix"].intValue
                let height = pathPhoto["height"].intValue
                
                let aPlace = Place(id: id, name: name, latitude: lat, longitude: lng, formattedAddress: address, distance: distance, photoPrefix: prefix, photoSuffix: suffix, photoWidth: width, photoHeight: height)
                places.append(aPlace)
            }

        }
        return places
    }
}
