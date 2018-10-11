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
            
//            let response = json!["response"]["group"]["results"][0]["venue"]["id"].stringValue
            let foundVenues = json!["response"]["group"]["results"].array
            for venue in foundVenues! {
                let venueId = venue["venue"]["id"].stringValue
                venues.append(venueId)
            }

        }
        return venues
    }
    
    static func decodeJsonPlaces(arrayOfVenues: [String]) -> [Place] {
//        json.data(using: .utf8)
        let places = [Place]()
        return places
    }
}
