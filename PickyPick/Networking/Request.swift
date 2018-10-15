//
//  Request.swift
//  PickyPick
//
//  Created by Daniel Yen on 10/4/18.
//  Copyright © 2018 Daniel Yen. All rights reserved.
//

import Foundation
import Alamofire

class Request {
    static func searchVenues(clicked: String, latitude: String, longitude: String, competionHandler: @escaping (String?) -> Void) {

        let intent = clicked.lowercased()

//"https://api.foursquare.com/v2/venues/5401139d498eee2f7aa74900?client_id=\(clientId)&client_secret=\(clientSecret)&v=20171008"
        Alamofire.request("https://api.foursquare.com/v2/search/recommendations?client_id=\(Constants.CLIENT_ID)&client_secret=\(Constants.CLIENT_SECRET)&v=20181010&ll=\(latitude),\(longitude)&intent=\(intent)").responseJSON { response in
//            if let json = response.result.value {
//                print("JSON: \(json)") // serialized json response
//            }

            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
//                print("Data: \(utf8Text)") // original server data as UTF8 string
                competionHandler(utf8Text)
            }
        }
    }
    
    static func searchVenueDetails(venueId: String, competionHandler: @escaping (String?) -> Void) {
        Alamofire.request("https://api.foursquare.com/v2/venues/\(venueId)?client_id=\(Constants.CLIENT_ID)&client_secret=\(Constants.CLIENT_SECRET)&v=20181010").responseData { response in
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
//                print(utf8Text)
                competionHandler(utf8Text)
            }
        }
    }
}
