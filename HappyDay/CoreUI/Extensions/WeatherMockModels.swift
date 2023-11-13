import Foundation

extension WeatherResponse {
    static var weatherResponseMock: WeatherResponse {
        let response: WeatherResponse = Bundle.main.loadAndDecodeJSON("forecast_info")
        return response
    }
}

extension CurrentWeather {
    static var currentWeatherMock: CurrentWeather {
        let response: CurrentWeather = Bundle.main.loadAndDecodeJSON("today_info")
        return response
    }
}

extension Bundle {
    func loadAndDecodeJSON<T: Decodable>(_ file: String) -> T {
        guard let url = url(forResource: file, withExtension: "geojson") else {
            fatalError("Provided URL is invalid")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("The weather data is invalid")
        }

        let jsonDecoder = JSONDecoder()
        guard let decoded = try? jsonDecoder.decode(T.self, from: data) else {
            fatalError("Failed to decode data")
        }
        return decoded
    }
}
