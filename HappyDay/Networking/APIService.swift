import Foundation

struct APIService: APIServiceProtocol {
    private let apiKey = "55f15b65c20862e666386d2b705cd8de"
    private let baseAPIURL = "https://api.openweathermap.org/data/2.5"

    func fetchWeatherToday(lat: String, lon: String) async throws -> CurrentWeather {
        guard let url = URL(string: "\(baseAPIURL)/weather?lat=\(lat)&lon=\(lon)&appid=\(apiKey)") else {
            throw WeatherError.invalidURL
        }

        let weatherTodayResult: CurrentWeather = try await fetchData(url: url)
        return weatherTodayResult
    }

    func fetchWeatherForecast(lat: String, lon: String) async throws -> WeatherResponse {
        guard let url = URL(string: "\(baseAPIURL)/forecast?lat=\(lat)&lon=\(lon)&appid=\(apiKey)") else {
            throw WeatherError.invalidURL
        }

        let weatherForecastResult: WeatherResponse = try await fetchData(url: url)
        return weatherForecastResult
    }

    func fetchData<T: Decodable>(url: URL) async throws -> T {
        let urlSession = URLSession.shared
        let (data, response) = try await urlSession.data(from: url)

        guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
            throw WeatherError.serverError
        }
        do {
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch {
            throw WeatherError.invalidData
        }
    }
}
