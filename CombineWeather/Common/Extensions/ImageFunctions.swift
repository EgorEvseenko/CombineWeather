//
//  UIImage + Extension.swift
//  CombineWeather
//
//  Created by Егор Евсеенко on 15.11.2021.
//

import UIKit

struct ImageFunctions {
    static func chooseSystemPicture(_ imageId: String)-> String{
        switch imageId{
        case "01d":
            return "sun.max.fill"
        case "01n":
            return "moon.fill"
        case "02d":
            return "cloud.sun.fill"
        case "02n":
            return "cloud.moon.fill"
        case "03d", "03n":
            return "cloud.fill"
        case "04d", "04n":
            return "cloud.fill"
        case "09d", "09n", "10d", "10n":
            return  "cloud.heavyrain.fill"
        case "11d":
            return "cloud.sun.rain.fill"
        case "11n":
            return "cloud.moon.bolt.fill"
        case "13d", "13n":
            return "snowflake"
        case "50d", "50n":
            return "wind"
        default: return ""
        }
    }
    
    static func choosePicture(_ imageId: String )-> String{
        switch imageId{
        case "01d":
            return "clear-day"
        case "01n":
            return "clear-night"
        case "02d":
            return "partly-cloudy-day"
        case "02n":
            return "partly-cloudy-night"
        case "03d", "03n":
            return "cloudy"
        case "04d", "04n":
            return "overcast"
        case "09d", "09n", "10d", "10n":
            return  "rain"
        case "11d", "11n":
            return "storm"
        case "13d", "13n":
            return "snow"
        case "50d", "50n":
            return "wind"
        default: return ""
        }
    }
}
