import Foundation
import SwiftUI

protocol APIServiceProtocol {
    func fetchWeatherToday(lat: String, lon: String) async throws -> CurrentWeather
    func fetchWeatherForecast(lat: String, lon: String) async throws -> WeatherResponse
}
