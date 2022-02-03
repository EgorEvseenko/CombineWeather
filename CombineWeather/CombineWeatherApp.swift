//
//  CombineWeatherApp.swift
//  CombineWeather
//
//  Created by Егор Евсеенко on 12.11.2021.
//

import SwiftUI

@main
struct CombineWeatherApp: App {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().tintColor = UIColor.white
        UITableView.appearance().backgroundColor = .clear
        UITableView.appearance().showsVerticalScrollIndicator = false
    }
    
    var body: some Scene {
        WindowGroup {
            CurrentWeatherView()
        }
    }
}
