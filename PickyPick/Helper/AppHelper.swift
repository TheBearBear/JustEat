//
//  AppHelper.swift
//  PickyPick
//
//  Created by Daniel Yen on 10/4/18.
//  Copyright © 2018 Daniel Yen. All rights reserved.
//

import Foundation

class AppHelper {
    static func getCurrentLocation() {
        return
    }
    
    static func getTodayDate() -> String {
        let todayDate:Date = Date()
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        let todayString:String = dateFormatter.string(from: todayDate)
        return todayString
    }
}
