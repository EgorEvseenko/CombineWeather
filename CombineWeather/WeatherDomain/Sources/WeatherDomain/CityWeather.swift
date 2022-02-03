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
//    let base: String
    let main: CityMain
//    let visibility: Int
//    let wind: Wind
//    let clouds: Clouds
//    let dt: Int
//    let sys: Sys
//    let timezone, id: Int
    let name: String
//    let cod: Int
}

// MARK: - Clouds
//struct Clouds: Codable {
//    let all: Int
//}

// MARK: - Coord
struct Coord: Codable {
    let lon: Double
    let lat: Double
}

// MARK: - Main
struct CityMain: Codable {
    let temp: Double
    
}

// MARK: - Sys
//struct Sys: Codable {
//    let type, id: Int
//    let country: String
//    let sunrise, sunset: Int
//}

// MARK: - Weather
struct CityWeather: Codable {
    let description: String
    let icon: String
}

// MARK: - Wind
//struct Wind: Codable {
//    let speed: Double
//    let deg: Int
//    let gust: Double
//}
