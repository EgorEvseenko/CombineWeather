import UIKit

public class ForecastModel {
    public var time: String
    public var celcius: String
    public var image: String
    
    public init(time: String, celcius: String, image: String){
        self.time = time
        self.celcius = celcius
        self.image = image
    }
}
