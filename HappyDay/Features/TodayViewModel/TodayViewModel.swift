import CoreLocation
import Foundation
import SwiftUI

class TodayViewModel: NSObject, ObservableObject {
    // EnableLocationView
    let enableLocationViewTitlePart1 = String.LocalizableSwiftUI.enableLocationViewTitlePart1
    let enableLocationViewTitlePart2 = String.LocalizableSwiftUI.enableLocationViewTitlePart2
    let enableLocationViewButtonTitle = String.LocalizableSwiftUI.enableLocationViewButtonTitle
    let enableLocationViewTextMessage = String.LocalizableSwiftUI.enableLocationViewTextMessage

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
