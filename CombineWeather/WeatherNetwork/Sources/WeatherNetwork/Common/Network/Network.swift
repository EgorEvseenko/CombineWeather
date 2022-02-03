import Foundation
import Combine

public final class Network: Networking {
    // MARK: - Variables
    private let requestFactory: NetworkRequestFactoring
    private let session: WURLSession
    private let scheduler = DispatchQueue(label: "NetworkQueue", qos: .background)

    // MARK: - Methods
    public init(requestFactory: NetworkRequestFactoring,
                session: WURLSession) {
        self.requestFactory = requestFactory
        self.session = session
    }

    public func execute<T>(_ requestConfig: RequestConfig) -> AnyPublisher<T, WError> where T: NetworkResponse {
        return requestFactory.urlRequest(requestConfig)
            .subscribe(on: scheduler)
            .flatMap({ [weak self] (request) in
                return self?.executeRequest(request: request) ?? Empty().eraseToAnyPublisher()
            })
            .receive(on: RunLoop.main)
            .mapCatch({ (error) -> AnyPublisher<T, WError> in
                return .fail(error)
            })
            .eraseToAnyPublisher()
    }

    private func executeRequest<T>(request: URLRequest) -> AnyPublisher<T, WError> where T: NetworkResponse {
        return session.dataTaskPublisher(for: request)
            .decode(when: request)
            .eraseToAnyPublisher()
    }
}
