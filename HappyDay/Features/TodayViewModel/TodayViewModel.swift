import CoreLocation
import Foundation
import SwiftUI

class TodayViewModel: NSObject, ObservableObject {
    // EnableLocationView
    let enableLocationViewTitlePart1 = "Enable"
    let enableLocationViewTitlePart2 = "location"
    let enableLocationViewButtonTitle = "Enable location"
    let enableLocationViewTextMessage = "Give us permission to see forecast for your current location."

    private let manager = CLLocationManager()
    @Published var userLocation: CLLocation?

    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
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
