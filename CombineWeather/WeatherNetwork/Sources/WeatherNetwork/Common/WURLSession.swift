import Foundation

public protocol WURLSession {
    func dataTaskPublisher(for request: URLRequest) -> URLSession.DataTaskPublisher
}

public class DefaultURLSession: WURLSession {
    private let session: URLSession

    public init() {
        session = URLSession.shared
    }

    public func dataTaskPublisher(for request: URLRequest) -> URLSession.DataTaskPublisher {
        return session.dataTaskPublisher(for: request)
    }
}
