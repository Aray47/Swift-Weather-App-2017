//
//  Weather.swift
//
//
//  Created by xcode on 2/17/18.
//  Copyright © 2018 xcode. All rights reserved.
//

import Foundation
import CoreLocation

struct Weather {
    
    let summary:String
    let icon:String
    let temperature:Double
    let windSpeed:Double
    let temperatureHigh:Double
    let temperatureLow:Double
    
    enum SerializationError:Error {
        case missing(String)
        case invalid(String, Any)
    }
    
    
    init(json:[String:Any]) throws {
        
        guard let summary = json["summary"] as? String else {throw SerializationError.missing("summary is missing")}
        guard let icon = json["icon"] as? String else {throw SerializationError.missing("icon is missing")}
        guard let temperature = json["temperatureMax"] as? Double else {throw SerializationError.missing("temp is missing")}
        guard let windSpeed = json["windSpeed"] as? Double else {throw SerializationError.missing("wind speed is missing")}
        guard let temperatureHigh = json["temperatureHigh"] as? Double else {throw SerializationError.missing("tempHigh is missing")}
        guard let temperatureLow = json["temperatureLow"] as? Double else {throw SerializationError.missing("tempLow is missing")}
        
        self.summary = summary
        self.icon = icon
        self.temperature = temperature
        self.windSpeed = windSpeed
        self.temperatureHigh = temperatureHigh
        self.temperatureLow = temperatureLow
    }
    
    static let basePath = "https://api.darksky.net/forecast/68a2707c4e823e6373fa5b302c12af90/"
    static func forecast (withLocation location:CLLocationCoordinate2D, completion: @escaping ([Weather]?) -> ()) {
        
        let url = basePath + "\(location.latitude),\(location.longitude)"
        let request = URLRequest(url: URL(string: url)!)
        let task = URLSession.shared.dataTask(with: request) { (data:Data?, response:URLResponse?, error:Error?) in
            var forecastArray:[Weather] = []
            if let data = data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                        if let dailyForecasts = json["daily"] as? [String:Any] {
                            if let dailyData = dailyForecasts["data"] as? [[String:Any]] {
                                for dataPoint in dailyData {
                                    if let weatherObject = try? Weather(json: dataPoint) {
                                        forecastArray.append(weatherObject)
                                    }
                                }
                            }
                        }
                    
                    }
                } catch {
                    print(error.localizedDescription)
                }
                completion(forecastArray)
            }
        }
        task.resume()
    }
}
