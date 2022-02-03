import SwiftUI
import Foundation
import Combine
import WeatherDomain
import CoreLocation

public protocol WeatherUseCaseType {
    func getMainInfo() -> AnyPublisher<APIResponse, WError>
    func getWeatherForOneDay() -> AnyPublisher<WeatherResponse, WError>
}

public final class AuthUseCase: WeatherUseCaseType {
    
    // MARK: - Variables
    private var network: Networking
    private var cancellableSet: Set<AnyCancellable> = []
    @ObservedObject private(set) var locationManager: LocationManager = LocationManager()
    
    // MARK: - Methods
    public init(network: Networking) {
        self.network = network
        
//        $locationManager.lastLocation
//            .receive(on: RunLoop.main)
//            .sink { [weak self] in
//                guard let self = self else { return }
//                self.getWeather()
//            }
//            .store(in: &cancellableSet)
    }
    
    
    public func getMainInfo() -> AnyPublisher<APIResponse, WError> {
        let request = AuthRequestConfig.getMainInfo(location: locationManager.lastLocation ?? CLLocation())
        let response: AnyPublisher<GetEntriesResponse, WError> = network.execute(request)
        return response
            .map({ $0.items })
            .eraseToAnyPublisher()
    }
    
    public func getWeatherForOneDay() -> AnyPublisher<WeatherResponse, WError> {
        let request = AuthRequestConfig.getWeatherForOneDay(location: locationManager.lastLocation ?? CLLocation())
        let response: AnyPublisher<WeatherForOneDayResponse, WError> = network.execute(request)
        return response
            .map({ $0.items })
            .eraseToAnyPublisher()
    }
}
