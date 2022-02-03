import Foundation
import Combine

extension Publisher where Output == URLSession.DataTaskPublisher.Output {
    func decode<T: NetworkResponse>(as type: T.Type = T.self, when request: URLRequest) -> AnyPublisher<T, WError> {
        return tryMap({ (data) -> T in
            do {
                Swift.debugPrint("Request - URL: \(request.url?.absoluteString ?? "-")")
                Swift.debugPrint("Request - Headers: \(request.allHTTPHeaderFields ?? [:])")
                Swift.debugPrint("Decoding [Type] - \(type)")
                return try T(data.data, response: data.response)
            } catch {
                Swift.debugPrint("Decoding [Data] - \(String(data: data.data, encoding: .utf8) ?? "<nil>")")
                Swift.debugPrint(error)
                throw WError.unexpectedError
            }
        })
        .mapError({ (error) -> WError in
            if let error = error as? WError {
                return error
            }
            switch error {
            case URLError.notConnectedToInternet:
                return .notConnectedToInternet
            default:
                return .unexpected(error: error)
            }
        })
        .eraseToAnyPublisher()
    }
}
