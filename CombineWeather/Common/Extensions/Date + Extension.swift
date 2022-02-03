import Foundation

extension Date {
    func toString (dateFormatter: DateFormatter) -> String? {
        return dateFormatter.string(from: self)
    }
    
    func weekdayName(from: Date) -> String {
        let formatter = DateFormatter();
        formatter.dateFormat = "EEEE"
        return formatter.string(from: from)
    }
}
