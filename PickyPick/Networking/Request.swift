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

        Alamofire.request("https://api.foursquare.com/v2/search/recommendations?client_id=\(Constants.CLIENT_ID)&client_secret=\(Constants.CLIENT_SECRET)&v=20181010&ll=\(latitude),\(longitude)&intent=\(intent)&soryByDistance=true&openNow=true").responseJSON { response in
            
            // JSON - use response.result.value
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
//                print(utf8Text)
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
