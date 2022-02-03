import Foundation

extension URL {
    init(base: String, path: String) {
        guard let url = URL(string: "\(base)\(path)") else {
            preconditionFailure("Invalid URL used to create URL instance")
        }
        self = url
    }
    
    
        mutating func appendQueryItems(_ items: [URLQueryItem]?) {
            guard var urlComponents = URLComponents(string: absoluteString) else {
                preconditionFailure("Invalid URL used to create URL instance")
            }
            urlComponents.queryItems = items
    
            guard let url = urlComponents.url else { return }
            self = url
        }
}
