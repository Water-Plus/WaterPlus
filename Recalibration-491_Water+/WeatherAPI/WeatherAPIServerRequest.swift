//
//  WeatherAPIServerRequest.swift
//  Recalibration-491_Water+
//
//  Created by Shawn Shirazi on 3/7/24.
//

import Alamofire
import SwiftyJSON
import SwiftUI


class WeatherServerFetchRequest: ObservableObject {
    
    
    func find() {
        
        AF.request("https://api.weather.gov/points/{-77.8308822},{38.9589245}").responseJSON { response in

            print(response)
        }
    }
}
