import Foundation
import CoreLocation

enum AuthRequestConfig {
    case getMainInfo(location: CLLocation)
    case getWeatherForOneDay(location: CLLocation)
    case getWeatherForSearchCity(cityName: String)
}

extension AuthRequestConfig: RequestConfig {
    var queryItems: [URLQueryItem]? {
        switch self {
        case .getMainInfo(let location):
            return [
                URLQueryItem(name: "lat", value: "\(location.coordinate.latitude)"),
                URLQueryItem(name: "lon", value: "\(location.coordinate.longitude)"),
                URLQueryItem(name: "appid", value: "12e7b051aaa0b70f50cd94dd491416b6"),
                URLQueryItem(name: "units", value: "metric"),
                URLQueryItem(name: "exclude", value: "alerts")
            ]
        case .getWeatherForOneDay(let location):
            return  [
                URLQueryItem(name: "lat", value: "\(location.coordinate.latitude)"),
                URLQueryItem(name: "lon", value: "\(location.coordinate.longitude)"),
                URLQueryItem(name: "appid", value: "12e7b051aaa0b70f50cd94dd491416b6"),
                URLQueryItem(name: "units", value: "metric"),
                URLQueryItem(name: "exclude", value: "alerts")
            ]
            
        case .getWeatherForSearchCity(let cityName):
            return [
                URLQueryItem(name: "appid", value: "12e7b051aaa0b70f50cd94dd491416b6"),
                URLQueryItem(name: "q", value: cityName),
                URLQueryItem(name: "cnt", value: "metric"),
                URLQueryItem(name: "units", value: "metric"),
                URLQueryItem(name: "mode", value: "json")
            ]
            
        }
    }
    
    var path: String {
        switch self {
        case .getMainInfo(let location):
            return "weather?lat=\(location.coordinate.latitude)&lon=\(location.coordinate.longitude)&appid=12e7b051aaa0b70f50cd94dd491416b6&units=metric"
        case .getWeatherForOneDay(let location):
            return "onecall?lat=\(location.coordinate.latitude)&lon=\(location.coordinate.longitude)&appid=12e7b051aaa0b70f50cd94dd491416b6&units=metric"
        case .getWeatherForSearchCity(let cityName):
            return "weather?q=\(cityName)&mode=json&appid=12e7b051aaa0b70f50cd94dd491416b6&lang=en&cnt=metric"
            
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getMainInfo:
            return .get
        case .getWeatherForOneDay:
            return .get
        case .getWeatherForSearchCity:
            return .get
        }
    }
    
    var bodyParameters: [String : Any]? {
        switch self {
        case .getMainInfo:
            return nil
        case .getWeatherForOneDay:
            return nil
        case .getWeatherForSearchCity:
            return nil
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .getMainInfo:
            return nil
        case .getWeatherForOneDay:
            return nil
        case .getWeatherForSearchCity:
            return nil
        }
    }
    
    var shouldAddUserToken: Bool { false }
}
