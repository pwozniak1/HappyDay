import Foundation

extension TodayViewModel {
    enum ApiStateToday {
        case success
        case loading
        case error
    }

    enum ApiStateForecast {
        case success
        case loading
        case error
    }
}
