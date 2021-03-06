import Foundation

public enum WError: Error {
    case tokenExpired
    case renewTokenExpired
    case unexpectedResponse(message: String)
    case unexpected(error: Error)
    case unexpectedError
    case notConnectedToInternet
}
