import Foundation

struct APIMockService: APIServiceProtocol {
    var resultToday: Result<CurrentWeather, Error>?
    var resultForecast: Result<WeatherResponse, Error>?

    func fetchWeatherToday(lat _: String, lon _: String) async throws -> CurrentWeather {
        return try resultToday!.get()
    }

    func fetchWeatherForecast(lat _: String, lon _: String) async throws -> WeatherResponse {
        return try resultForecast!.get()
    }
}
