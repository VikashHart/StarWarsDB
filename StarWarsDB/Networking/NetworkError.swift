import Foundation

enum NetworkError: Error {
    case badURL
    case badStatusCode
    case apiError(Error)
    case jsonDecoding(Error)
    case networkError
    case clientError
    case serverError
    case unknownError
}
