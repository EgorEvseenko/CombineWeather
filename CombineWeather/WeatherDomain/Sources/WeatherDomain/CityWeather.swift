//
//  CityWeather.swift
//  CombineWeather
//
//  Created by Егор Евсеенко on 24.11.2021.
//

import Foundation

// MARK: - APIResponse
struct CityAPIResponse: Codable {
    let coord: Coord
    let weather: [CityWeather]
    let main: CityMain
    let name: String
}

// MARK: - Coord
struct Coord: Codable {
    let lon: Double
    let lat: Double
}

// MARK: - Main
struct CityMain: Codable {
    let temp: Double
    
}

// MARK: - Weather
struct CityWeather: Codable {
    let description: String
    let icon: String
}
