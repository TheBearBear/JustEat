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
        let returnValue = Float(meter) * 0.000621371
        return round(returnValue * 100)/100
    }
    
    static func decodeJsonVenues(json: String) -> [Place] {
        var places = [Place]()
        
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
    
    static func subStrCharacter(str: String, char: Character) -> String {
        if str.contains(char) {
            let index = str.range(of: "(")?.lowerBound
            return String(str[str.startIndex..<index!])
        } else {
            return str
        }
    }
    
    static func attributedText(str: String, fontStyle: String, fontSize: CGFloat, color: UIColor) -> NSMutableAttributedString {
        return NSMutableAttributedString(string: str, attributes: [NSAttributedString.Key.foregroundColor: color, NSMutableAttributedString.Key.font: UIFont(name: fontStyle, size: fontSize)!])
    }
}
