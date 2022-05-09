//
//  CurrentWeatherModel.swift
//  CombineWeather
//
//  Created by Егор Евсеенко on 15.11.2021.
//

import Foundation

// MARK: - APIResponse
public struct MainWeatherResponse: Codable {
    public let coord: Coordinate
    public let weather: [Weather]
    public let main: Main
    public let sys: System
    public let name: String
}

// MARK: - Coord
public struct Coordinate: Codable {
    public let lon: Double
    public let lat: Double
}

// MARK: - Main
public struct Main: Codable {
    public let temp: Double
    public let pressure: Double
    public let humidity: Double
}

// MARK: - System
public struct System: Codable{
    public let sunrise: Double
    public let sunset: Double
}

// MARK: - Weather
public struct Weather: Codable {
    public let id: Double
    public let main: String
    public let description: String
    public let icon: String
}
