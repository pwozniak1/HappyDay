import CoreLocation
import Foundation
import SwiftUI

class TodayViewModel: NSObject, ObservableObject {
    // EnableLocationView
    let enableLocationViewTitlePart1 = String.LocalizableSwiftUI.enableLocationViewTitlePart1
    let enableLocationViewTitlePart2 = String.LocalizableSwiftUI.enableLocationViewTitlePart2
    let enableLocationViewButtonTitle = String.LocalizableSwiftUI.enableLocationViewButtonTitle
    let enableLocationViewTextMessage = String.LocalizableSwiftUI.enableLocationViewTextMessage
    // TodaySuccessView
    let todayWeatherViewTitleItsRainingPart1 = String.LocalizableSwiftUI.todayWeatherViewTitleItsRainingPart1
    let todayWeatherViewTitleItsRainingPart2 = String.LocalizableSwiftUI.todayWeatherViewTitleItsRainingPart2
    let todayWeatherViewTitleItsHotAsFuPart1 = String.LocalizableSwiftUI.todayWeatherViewTitleItsHotAsFuPart1
    let todayWeatherViewTitleItsHotAsFuPart2 = String.LocalizableSwiftUI.todayWeatherViewTitleItsHotAsFuPart2
    let todayWeatherViewHumidity = String.LocalizableSwiftUI.todayWeatherViewHumidity
    let todayWeatherViewPrecipitation = String.LocalizableSwiftUI.todayWeatherViewPrecipitation
    let todayWeatherViewPressure = String.LocalizableSwiftUI.todayWeatherViewPressure
    let todayWeatherViewDirection = String.LocalizableSwiftUI.todayWeatherViewDirection
    let todayWeatherViewWind = String.LocalizableSwiftUI.todayWeatherViewWind
    let todayWeatherViewTabItemToday = String.LocalizableSwiftUI.todayWeatherViewTabItemToday
    let todayWeatherViewTabItemForecast = String.LocalizableSwiftUI.todayWeatherViewTabItemForecast
    // TodayErrorView
    let todayErrorViewTitlePart1 = String.LocalizableSwiftUI.todayErrorViewTitlePart1
    let todayErrorViewTitlePart2 = String.LocalizableSwiftUI.todayErrorViewTitlePart2
    let todayErrorViewTitlePart3 = String.LocalizableSwiftUI.todayErrorViewTitlePart3
    let todayErrorViewTextMessage = String.LocalizableSwiftUI.todayErrorViewTextMessage

    @Published var currentTagSelection = 0

    @Published var startPoint: CGFloat = 0.0
    @Published var endPoint: CGFloat = 1.0

    private let manager = CLLocationManager()
    @Published var userLocation: CLLocation?

    @Published var apiStateToday: ApiStateToday? = .success
    @Published var apiStateForecast: ApiStateForecast?

    @Published var todayWeather: CurrentWeather?
    @Published var weatherResponse: WeatherResponse?

    let service: APIServiceProtocol

    init(service: APIServiceProtocol = APIService()) {
        self.service = service
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
    }

    func startAnimation() {
        withAnimation(Animation.easeInOut(duration: 3.5).repeatForever(autoreverses: true)) {
            startPoint = startPoint == 1 ? 0 : 1
            endPoint = endPoint == 1 ? 0 : 1
        }
    }

    func requestLocation() {
        manager.requestWhenInUseAuthorization()
    }

    func createCityAndCountryName(cityName: String, countryName: String) -> String {
        if !cityName.isEmpty && !countryName.isEmpty {
            return cityName + ", " + countryName
        } else if cityName.isEmpty && !countryName.isEmpty {
            return countryName
        } else if !cityName.isEmpty && countryName.isEmpty {
            return cityName
        } else {
            return ""
        }
    }

    func loadAgainButtonErrorView(state: LoadAgainButtonErrorViewState) {
        if state == .today {
            Task { await fetchTodayData() }
        } else if state == .forecast {
            Task { await fetchForecastData() }
        }
    }
}

extension TodayViewModel {
    func fetchTodayData() async {
        let latitude = String(userLocation?.coordinate.latitude ?? 0)
        let longitude = String(userLocation?.coordinate.longitude ?? 0)

        do {
            let decodedData = try await service.fetchWeatherToday(lat: latitude, lon: longitude)
            await MainActor.run {
                self.todayWeather = decodedData
                self.apiStateToday = .success
            }
        } catch {
            await MainActor.run {
                self.apiStateToday = .error
            }
        }
    }

    func fetchForecastData() async {
        let latitude = String(userLocation?.coordinate.latitude ?? 0)
        let longitude = String(userLocation?.coordinate.longitude ?? 0)

        do {
            let decodedData = try await service.fetchWeatherForecast(lat: latitude, lon: longitude)
            await MainActor.run {
                self.weatherResponse = decodedData
                self.apiStateForecast = .success
            }
        } catch {
            await MainActor.run {
                self.apiStateForecast = .error
            }
        }
    }
}

extension TodayViewModel: CLLocationManagerDelegate {
    func locationManager(_: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        userLocation = location
    }
}
