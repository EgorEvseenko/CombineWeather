import Foundation
import WeatherDomain

public struct GetEntriesResponse {
    public let items: MainWeatherResponse
                       
    public init(items: MainWeatherResponse) {
        self.items = items
    }
}

extension GetEntriesResponse: NetworkResponse {
    enum RootCodingKey: String, CodingKey {
        case items
    }

    public init(from decoder: Decoder) throws {
        let rootContainer = try decoder.singleValueContainer()
        self.init(
            items: try rootContainer.decode(MainWeatherResponse.self)
        )
    }
}


public struct WeatherForOneDayResponse {
    public let items: WeatherResponse
                       
    public init(items: WeatherResponse) {
        self.items = items
    }
}

extension WeatherForOneDayResponse: NetworkResponse {
    enum RootCodingKey: String, CodingKey {
        case items
    }

    public init(from decoder: Decoder) throws {
        let rootContainer = try decoder.singleValueContainer()
        self.init(
            items: try rootContainer.decode(WeatherResponse.self)
        )
    }
}
