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

    @Published var currentTagSelection = 0

    @Published var startPoint: CGFloat = 0.0
    @Published var endPoint: CGFloat = 1.0

    private let manager = CLLocationManager()
    @Published var userLocation: CLLocation?

    @Published var apiStateToday: ApiStateToday? = .success

    override init() {
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
}

extension TodayViewModel: CLLocationManagerDelegate {
    func locationManager(_: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        userLocation = location
    }
}
