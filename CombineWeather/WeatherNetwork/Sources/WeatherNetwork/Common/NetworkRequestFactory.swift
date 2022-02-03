import Combine
import UIKit

public protocol NetworkRequestFactoring {
    func urlRequest(_ requestConfig: RequestConfig) -> AnyPublisher<URLRequest, WError>
}

public final class NetworkRequestFactory: NetworkRequestFactoring {
    private let config: NetworkConfig

    public init(config: NetworkConfig) {
        self.config = config
    }

    public func urlRequest(_ requestConfig: RequestConfig) -> AnyPublisher<URLRequest, WError> {
        return allHTTPHeaderFields(requestConfig)
            .flatMap({ [weak self] allHTTPHeaderFields -> AnyPublisher<URLRequest, WError> in
                guard let endpoint = self?.config.endpoint else {
                    return Empty().eraseToAnyPublisher()
                }
                var url = URL(base: endpoint, path: requestConfig.path)
                url.appendQueryItems(requestConfig.queryItems)
                var request = URLRequest(url: url)
                request.httpMethod = requestConfig.method.rawValue
                request.allHTTPHeaderFields = allHTTPHeaderFields
                request.httpBody = self?.httpBody(requestConfig)
                print()
                return .just(request)
            })
            .eraseToAnyPublisher()
    }


    private func httpBody(_ requestConfig: RequestConfig) -> Data? {
        guard let parameters = requestConfig.bodyParameters else {
            return nil
        }
        do {
            return try JSONSerialization.data(withJSONObject: parameters, options: [.prettyPrinted])
        } catch {
            Swift.debugPrint(error)
            return nil
        }
    }
    
    private func allHTTPHeaderFields(_ requestConfig: RequestConfig) -> AnyPublisher<[String: String]?, WError> {
        var headers: [String: String] = [:]
        if let additionalHeaders = requestConfig.headers {
            headers.merge(additionalHeaders, uniquingKeysWith: { (_, new) in new })
        }
        return .just(headers).eraseToAnyPublisher()
    }
}
