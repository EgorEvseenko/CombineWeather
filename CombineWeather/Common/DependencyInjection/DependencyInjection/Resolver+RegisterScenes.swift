import Foundation
import Resolver

extension Resolver {
    static func registerScenes() {
        AuthDependencyInjection.register()
//        PlansDependencyInjection.register()
    }
}

struct AuthDependencyInjection {
    static func register() {
        Resolver.register { CurrentWeatherView() }
        Resolver.register { CurrentViewModel() }
        Resolver.register { InitiateAuthInteractor() }
            .implements(InitiateWeatherInteracting.self)
    }
}

