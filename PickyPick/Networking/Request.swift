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
        let clientId = "EC0H3F0WFLQNA1AE0W2GLKV5BFPEMH0MVYVM3D0DQF2EHJP2"
        let clientSecret = "Q4I5UZD1KUHPKGSFT20RJQPPVW5RLNEZZSKYW2VVRGI4SWSC"
        let todayDate = AppHelper.getTodayDate()
        let intent = clicked.lowercased()
//        var returnMe: String?
        
        Alamofire.request("https://api.foursquare.com/v2/search/recommendations?client_id=\(clientId)&client_secret=\(clientSecret)&ll=\(latitude),\(longitude)&intent=\(intent)&v=\(todayDate)").responseJSON { response in
//            if let json = response.result.value {
//                print("JSON: \(json)") // serialized json response
//            }

            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
//                print("Data: \(utf8Text)") // original server data as UTF8 string
                competionHandler(utf8Text)
            }
        }
    }
}
