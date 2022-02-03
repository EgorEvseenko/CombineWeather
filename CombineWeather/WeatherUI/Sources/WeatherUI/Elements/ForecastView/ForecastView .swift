//
//  ForecastView .swift
//  CombineWeather
//
//  Created by Егор Евсеенко on 12.11.2021.
//

import SwiftUI
import WeatherDomain

public struct ForecastView: View {
    private(set) var weatherModel: ForecastModel
    
    public init(weatherModel: ForecastModel) {
        self.weatherModel = weatherModel
    }
    
    public var body: some View {
        VStack(spacing: 15) {
            Text(Double(weatherModel.time)?.dateFormatted(withFormat : "HH") ?? "")
                .font(.callout.bold())
                .foregroundColor(.white)
            
            Image(systemName: weatherModel.image)
                .renderingMode(.original)
                .font(.title2)
            
            Text("\(weatherModel.celcius)")
                .font(.callout.bold())
                .foregroundColor(.white)
        }
    }
}
