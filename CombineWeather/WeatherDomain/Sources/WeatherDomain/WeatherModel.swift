//
//  WeatherModel.swift
//  CombineWeather
//
//  Created by Егор Евсеенко on 22.11.2021.
//

import Foundation

public struct HourlyView: Identifiable {
    public let id = UUID().uuidString
    public var date: String
    public var temperature: String
    public var icon: String
    
    public init(response: HourlyWeather){
        self.date = "\(response.dt)"
        self.temperature = "\(Int(response.temp))°"
        self.icon = response.weather.first!.icon
    }
}

public class DailyView: Identifiable{
    public let id = UUID().uuidString
    public var date: String
    public var minTemperature: String
    public var maxTemperature: String
    public var icon: String
    
    public init(response: DailyWeather) {
        self.date = "\(response.dt)"
        self.minTemperature = "\(Int(response.temp.min))°"
        self.maxTemperature = "\(Int(response.temp.max))°"
        self.icon = response.weather.first?.icon ?? ""
    }
}
