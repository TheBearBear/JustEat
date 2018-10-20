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
    
    static func decodeJsonVenues(json: String) -> [String] {
        var venues = [String]()
//        print(json)
//        guard let venuesJson = json.data(using: .utf8) else {
//            return venues
//        }
        
        if let dataFromString = json.data(using: .utf8, allowLossyConversion: false) {
            let json = try? JSON(data: dataFromString)
            
            let foundVenues = json!["response"]["group"]["results"].array
            for venue in foundVenues! {
                let venueId = venue["venue"]["id"].stringValue
                venues.append(venueId)
            }

        }
        return venues
    }
    
    static func decodeJsonPlaces(json: String) -> Place {
        var place: Place?
        
        if let dataFromString = json.data(using: .utf8, allowLossyConversion:  false) {
            let json = try? JSON(data: dataFromString)
            let venue = json!["response"]["venue"]
            let name = venue["name"].stringValue
            let phone = venue["contact"]["formattedPhone"].stringValue
            let addressArray = venue["location"]["formattedAddress"].array
            let lat = venue["location"]["lat"].floatValue
            let lng = venue["location"]["lng"].floatValue
            var address = [String]()
            for anAddress in addressArray! {
                address.append(anAddress.stringValue)
            }
            let price = venue["price"]["currency"].stringValue
            let rating = venue["rating"].float
            let ratingColor = venue["ratingColor"].stringValue
            let hours = venue["hours"]["status"].stringValue
            
            let pathBP = venue["bestPhoto"]
            let prefix = pathBP["prefix"].stringValue
            let suffix = pathBP["suffix"].stringValue
            let width = pathBP["suffix"].intValue
            let height = pathBP["height"].intValue
            
            place = Place(name: name, latitude: lat, longitude: lng, phone: phone, formattedAddress: address, price: price, rating: rating, ratingColor: ratingColor, hours: hours, photoPrefix: prefix, photoSuffix: suffix, photoWidth: width, photoHeight: height)
            
        }
        
        return place!
    }
}
