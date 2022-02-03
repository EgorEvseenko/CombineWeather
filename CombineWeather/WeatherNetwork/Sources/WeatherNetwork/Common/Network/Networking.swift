import Combine

public protocol Networking {
    func execute<T: NetworkResponse>(_ requestConfig: RequestConfig) -> AnyPublisher<T, WError>
}
