import Foundation

struct Constants {
    static let calendar: Calendar = .current
    
    // Normally wouldn't use force unwraps here, but this is a convenience variable for the
    static var quotesTodayEndpoint: String {
        let componentsToday = calendar.dateComponents([.year, .month, .day], from: Date())
        let startOfDay = DateComponents(year: componentsToday.year, month: componentsToday.month, day: componentsToday.day, hour: 0, minute: 0)
        let startOfDayDate = calendar.date(from: startOfDay)!
        let endOfDay = DateComponents(year: componentsToday.year, month: componentsToday.month, day: componentsToday.day, hour: 23, minute: 59)
        let endOfDayDate = calendar.date(from: endOfDay)!
        return "https://api.ember.to/v1/quotes/?origin=13&destination=42&departure_date_from=\(startOfDayDate.ISO8601Format())&departure_date_to=\(endOfDayDate.ISO8601Format())"
    }
    
    static func tripsEndpoint(id: String) -> String {
        "https://api.ember.to/v1/trips/\(id)"
    }
}
