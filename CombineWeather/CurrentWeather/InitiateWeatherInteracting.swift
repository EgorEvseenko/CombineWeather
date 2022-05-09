import Combine
import Resolver
import WeatherNetwork
import WeatherDomain
import CoreLocation

public protocol InitiateWeatherInteracting {
    func getMainInfo() -> AnyPublisher<MainWeatherResponse, WError>
    func getWeatherForOneDay() -> AnyPublisher<WeatherResponse, WError>
}

class InitiateWeatherInteractor: InitiateWeatherInteracting {
    
    // MARK: - Variables
    private let authUseCase: WeatherUseCaseType

    // MARK: - Methods
    init(authUseCase: WeatherUseCaseType = Resolver.resolve()) {
        self.authUseCase = authUseCase
    }

    func getMainInfo() -> AnyPublisher<MainWeatherResponse, WError> {
        return authUseCase.getMainInfo()
    }
    
    func getWeatherForOneDay() -> AnyPublisher<WeatherResponse, WError> {
        return authUseCase.getWeatherForOneDay()
    }
}
