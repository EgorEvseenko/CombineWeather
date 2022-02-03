//
//  WeatherForToday.swift
//  CombineWeather
//
//  Created by Егор Евсеенко on 16.11.2021.
//

import Foundation

// MARK: - WeatherResponse
public struct WeatherResponse: Codable {
    public let timezone: String
    public let hourly: [HourlyWeather]
    public let daily: [DailyWeather]
}

// MARK: - HourlyWeather
public struct HourlyWeather: Codable, Identifiable {
    public let id = UUID().uuidString
    public let dt: Double
    public let temp: Double
    public let weather: [MainOfHourlyWeather]
    
    public init(dt: Double, temp: Double, weather: [MainOfHourlyWeather]) {
        self.dt = dt
        self.temp = temp
        self.weather = weather
    }
}

// MARK: - HourlyWeather
public struct MainOfHourlyWeather: Codable {
    public let icon: String
    
    public init(icon: String) {
        self.icon = icon
    }
    
}

// MARK: - DailyWeather
public struct DailyWeather: Codable {
    let dt: Double
    let temp: Temperature
    let weather: [MainOfHourlyWeather]
}

public struct Temperature: Codable {
    let min: Double
    let max: Double
}
