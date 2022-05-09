import Foundation
import Resolver
import WeatherNetwork

extension Resolver {
    static func registerNetwork() {
        registerCore()
        registerUseCases()
    }

    private static func registerCore() {
        register { Constants.networkConfig }
        register { DefaultURLSession() }
            .implements(WURLSession.self)
        register {
            Network(
                requestFactory: resolve(),
                session: resolve()
            )
        }
        .implements(Networking.self)
        register {
            NetworkRequestFactory(
                config: resolve()
            )
        }
        .implements(NetworkRequestFactoring.self)
    }

    private static func registerUseCases() {
        register { AuthUseCase(network: resolve()) }
            .implements(WeatherUseCaseType.self)
    }
}

