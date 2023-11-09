import Foundation

enum WeatherError: Error, LocalizedError {
    case invalidURL
    case serverError
    case invalidData
    case unkown(Error)

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Provided URL is invalid"
        case .serverError:
            return "There was an error with the server. Please try again later"
        case .invalidData:
            return "The weather data is invalid. Please try again later"
        case let .unkown(error):
            return error.localizedDescription
        }
    }
}
