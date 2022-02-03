//
//  CurrentWeatherViewModel.swift
//  CombineWeather
//
//  Created by Егор Евсеенко on 15.11.2021.
//
import UIKit
import SwiftUI
import WeatherUI
import Combine
import WeatherNetwork
import WeatherDomain
import CoreLocation
import Resolver

class CurrentViewModel: ObservableObject{
    @Published var cityName: String = ""
    @Published var temperature: String = ""
    @Published var weatherDescription: String = ""
    @Published var humudity: String = ""
    @Published var pressure: String = ""
    @Published var icon: String = ""
    @Published var sunrise: String = ""
    @Published var sunset: String = ""
    @Published var nameOfCity: String = ""
    @Published var hourlyData: [HourlyView] = []
    @Published var dailyData: [DailyView] = []
    
    private(set) var authInteractor: InitiateWeatherInteracting
    private(set) var cancellableSet = Set<AnyCancellable>()
    
    init(
        authInteractor: InitiateWeatherInteracting = Resolver.resolve()
    )
    {
        self.authInteractor = authInteractor
    }
    
     func getMainInfo() {
        let publisher: AnyPublisher<APIResponse, WError> = authInteractor.getMainInfo()
        publisher.sink(receiveCompletion: { completion in
            switch completion {
            case .failure(let error):
                debugPrint(error.localizedDescription)
            default:
                break
            }
        }, receiveValue: { response in
            print(response)
            self.setMainInfo(response: response)
        }).store(in: &cancellableSet)
    }
    
    func getWeatherForOneDay() {
        let publisher: AnyPublisher<WeatherResponse, WError> = authInteractor.getWeatherForOneDay()
        publisher.sink(receiveCompletion: { completion in
            switch completion {
            case .failure(let error):
                debugPrint(error.localizedDescription)
            default:
                break
            }
        }, receiveValue: { response in
            print(response)
            self.setHourlyView(response: response)
            self.setDailyView(response: response)
        }).store(in: &cancellableSet)
    }
    
        func setMainInfo(response: APIResponse?){
            guard let response = response else { return }
            self.cityName = response.name
            self.weatherDescription = response.weather.first?.description ?? ""
            self.temperature = "\(Int(response.main.temp))°"
            self.humudity = "\(Int(response.main.humidity)) %"
            self.pressure = "\(Int(response.main.pressure)) pha"
            self.icon = ImageFunctions.chooseSystemPicture(response.weather.first?.icon ?? "")
            self.sunrise = "\(Double(response.sys.sunrise).dateFormatted(withFormat : "HH:mm"))"
            self.sunset = "\(Double(response.sys.sunset).dateFormatted(withFormat : "HH:mm"))"
        }
    
        func setHourlyView(response: WeatherResponse?) {
            guard let response = response else { return }
            hourlyData.removeAll()
            for i in 0..<24 {
                hourlyData.append(HourlyView(response: response.hourly[i]))
            }
        }
    
        func setDailyView(response: WeatherResponse?) {
            guard let response = response else { return }
            dailyData.removeAll()
            for i in 0..<response.daily.count {
                let dailyView = DailyView(response: response.daily[i])
                dailyData.append(dailyView)
            }
        }
}
