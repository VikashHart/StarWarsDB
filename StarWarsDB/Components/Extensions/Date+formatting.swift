import Foundation

extension Date {
    static let inputFormatter = DateFormatter()
    static let dateFormatter = DateFormatter()

    static func formatDateString(dateString: String) -> String {
        inputFormatter.locale = Locale(identifier: "en_US_POSIX")
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SZ"
        dateFormatter.dateFormat = "EEE MMM d, yyyy h:mm a"
        guard let unformattedDate = inputFormatter.date(from: dateString)
            else {
                return "invalid date"
        }
        return dateFormatter.string(from: unformattedDate)
    }
}
