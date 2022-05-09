import Foundation
import Resolver
import WeatherNetwork

extension Resolver {
    static func registerScenes() {
        AuthDependencyInjection.register()
    }
}

struct AuthDependencyInjection {
    static func register() {
        Resolver.register { CurrentWeatherView() }
        Resolver.register { CurrentViewModel() }
        Resolver.register { InitiateWeatherInteractor() }
        .implements(InitiateWeatherInteracting.self)
    }
}

