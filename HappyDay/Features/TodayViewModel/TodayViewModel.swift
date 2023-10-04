import CoreLocation
import Foundation
import SwiftUI

class TodayViewModel: NSObject, ObservableObject {
    // EnableLocationView
    let enableLocationViewTitlePart1 = String.LocalizableSwiftUI.enableLocationViewTitlePart1
    let enableLocationViewTitlePart2 = String.LocalizableSwiftUI.enableLocationViewTitlePart2
    let enableLocationViewButtonTitle = String.LocalizableSwiftUI.enableLocationViewButtonTitle
    let enableLocationViewTextMessage = String.LocalizableSwiftUI.enableLocationViewTextMessage

    @Published var startPoint: CGFloat = 0.0
    @Published var endPoint: CGFloat = 1.0

    private let manager = CLLocationManager()
    @Published var userLocation: CLLocation?

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
