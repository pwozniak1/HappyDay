import Foundation

struct Section {
    let section: SectionType
}

enum SectionType {
    case today, tomorrow, thirdDay, fourthDay, fifthDay, sixthDay

    var headerName: String {
        switch self {
        case .today:
            return String.LocalizableUIKit.forecastControllerTodayHeader
        case .tomorrow:
            return String.LocalizableUIKit.forecastControllerTomorrowHeader
        case .thirdDay:
            return String.LocalizableUIKit.forecastControllerThirdDayHeader
        case .fourthDay:
            return String.LocalizableUIKit.forecastControllerFourthDayHeader
        case .fifthDay:
            return String.LocalizableUIKit.forecastControllerFifthDayHeader
        case .sixthDay:
            return String.LocalizableUIKit.forecastControllerSixthDatHeader
        }
    }
}

let sections: [Section] = [.init(section: .today), .init(section: .tomorrow), .init(section: .thirdDay), .init(section: .fourthDay), .init(section: .fifthDay), .init(section: .sixthDay)]
