import Foundation

extension Double {
    /// Rounds the double to decimal places value
    func rounded(to places: Int) -> Double {
        return Double(Int((pow(10, Double(places)) * self).rounded())) / pow(10, Double(places))
    }
}
