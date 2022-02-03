import Foundation

public protocol NetworkResponse: Decodable {
    init(_ data: Data, response: URLResponse) throws
}

extension NetworkResponse {
    public init(_ data: Data, response: URLResponse) throws {
        self = try JSONDecoder().decode(Self.self, from: data)
    }
}
