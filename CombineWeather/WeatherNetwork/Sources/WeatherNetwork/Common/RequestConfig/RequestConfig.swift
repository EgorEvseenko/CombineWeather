import Foundation

public protocol RequestConfig {
    var path: String { get }
    var method: HTTPMethod { get }
    var bodyParameters: [String: Any]? { get }
    var queryItems: [URLQueryItem]? { get }
    var headers: [String: String]? { get }
    var shouldAddUserToken: Bool { get }
}
