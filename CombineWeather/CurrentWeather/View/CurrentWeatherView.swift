import SwiftUI
import WeatherUI
import Combine
import Resolver
import WeatherDomain

public struct CurrentWeatherView: View {
    @State var showingDetail = false
    @ObservedObject private(set) var viewModel: CurrentViewModel
    
    init(viewModel: CurrentViewModel = Resolver.resolve()) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        ZStack {
            GeometryReader{ proxy in
                Image("backgroundSky")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: proxy.size.width, height: proxy.size.height)
                
            }
            .ignoresSafeArea(.all)
            .blur(radius: 35)
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 15) {
                        VStack(alignment: .center, spacing: 8) {
                            Text("\(viewModel.cityName)")
                                .font(.system(size: 35))
                                .foregroundStyle(.white)
                            Text("\(viewModel.temperature)")
                                .font(.system(size: 45, weight: .light, design: .rounded))
                                .foregroundStyle(.white)
                            
                            Image(systemName: viewModel.icon)
                                .renderingMode(.original)
                                .aspectRatio(contentMode: .fill)
                                .font(.system(size: 70))
                            
                            Text(viewModel.weatherDescription)
                                .font(.system(size: 15))
                                .foregroundColor(.white)
                        }
                        
                        VStack{
                            CustomStackView {
                                Label {
                                    Text("24 Hours Forecast")
                                } icon: {
                                    Image(systemName: "clock")
                                }
                            } contentView: {
                                ScrollView(.horizontal, showsIndicators: false) {
                                    LazyHStack(spacing: 25) {
                                        ForEach(viewModel.hourlyData) { cell in
                                            ForecastView(weatherModel: ForecastModel(time: cell.date, celcius: cell.temperature, image: ImageFunctions.chooseSystemPicture(cell.icon)))
                                        }
                                    }
                                }
                            }
                        }
                        
                        
                        HStack {
                            CustomStackView {
                                Label {
                                    Text("Humidity")
                                } icon: {
                                    Image(systemName: "humidity")
                                }
                            } contentView: {
                                Text(viewModel.humudity)
                                
                            }
                            
                            CustomStackView {
                                Label {
                                    Text("Pressure")
                                } icon: {
                                    Image(systemName: "thermometer")
                                }
                            } contentView: {
                                Text(viewModel.pressure)
                                
                            }
                        }
                        
                        HStack {
                            CustomStackView {
                                Label {
                                    Text("Sunrise")
                                } icon: {
                                    Image(systemName: "sunrise")
                                }
                            } contentView: {
                                Text(viewModel.sunrise)
                                
                            }
                            
                            CustomStackView {
                                Label {
                                    Text("Sunset")
                                } icon: {
                                    Image(systemName: "sunset")
                                }
                            } contentView: {
                                Text(viewModel.sunset)
                                
                            }
                        }
                        
                        CustomStackView {
                            Label {
                                Text("7 Day Forecast")
                            } icon: {
                                Image(systemName: "calendar")
                            }
                        } contentView: {
                            VStack(alignment: .leading, spacing: 10) {
                                ForEach(viewModel.dailyData) { cell in
                                    HStack(spacing: 15) {
                                        Text(Double(cell.date)?.dateFormatted(withFormat : "EEEE") ?? "")
                                            .font(.title3.bold())
                                            .foregroundStyle(.white)
                                            .frame(width: 130, alignment: .leading)
                                        
                                        Image(systemName: ImageFunctions.chooseSystemPicture(cell.icon))
                                            .renderingMode(.original)
                                            .font(.title3.bold())
                                            .symbolVariant(.fill)
                                            .symbolRenderingMode(.palette)
                                            .frame(width: 30)
                                        
                                        Spacer()
                                        
                                        Text(cell.minTemperature)
                                            .multilineTextAlignment(.trailing)
                                            .font(.title3.bold())
                                            .foregroundStyle(.secondary)
                                            .foregroundStyle(.white)
                                        
                                        
                                        Text(cell.maxTemperature)
                                            .multilineTextAlignment(.trailing)
                                            .font(.title3.bold())
                                            .foregroundStyle(.secondary)
                                            .foregroundStyle(.white)
                                            .frame(width: 45)
                                    }
                                }
                            }
                        }
                    }
                    .padding(.top, 25)
                    .padding([.horizontal,.bottom])
                }
            }
        }
        .onAppear(perform: viewModel.getMainInfo)
        .onAppear(perform: viewModel.getWeatherForOneDay)
    }
}

struct CurrentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CurrentWeatherView()
                .previewDevice("iPhone 12 Pro Max")
            CurrentWeatherView()
                .previewDevice("iPhone SE (2nd generation)")
        }
    }
}
