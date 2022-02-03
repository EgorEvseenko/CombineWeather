import Foundation

extension String {
    func toDate (dateFormatter: DateFormatter) -> Date? {
        return dateFormatter.date(from: self)
    }
    
    func toDateString (dateFormatter: DateFormatter, outputFormat: String) -> String? {
        guard let date = toDate(dateFormatter: dateFormatter) else { return nil }
        return DateFormatter(format: outputFormat).string(from: date)
    }
}
