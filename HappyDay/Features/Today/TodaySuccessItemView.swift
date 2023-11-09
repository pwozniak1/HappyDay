import SwiftUI

struct TodaySuccessItemView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var viewModel: TodayViewModel
    let state: WeatherCellIconState
    let message: String

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ZStack {
                Circle()
                    .fill(colorScheme == .light ? Color.customWhite : .white.opacity(0.1))
                    .frame(width: 40)
                categoryImageName
            }

            VStack(alignment: .leading, spacing: 0) {
                Text(message)
                Text(state.categoryName)
                    .foregroundColor(.customGray)
                    .padding(.top, 5)
            }
            .padding(.top, 8)
            .font(.interMediumSize14Weight500)
        }
        .frame(width: 100, alignment: .leading)
    }

    var categoryImageName: some View {
        switch state {
        case .humidity:
            return Image.todayHumidityLight
        case .precipation:
            return Image.todayPrecipitationLight
        case .pressure:
            return Image.todayPressureLight
        case .wind:
            return Image.todayWindSpeedLight
        case .direction:
            return Image.todayWindDirectionLight
        }
    }
}

enum WeatherCellIconState {
    case humidity
    case precipation
    case pressure
    case wind
    case direction

    var categoryName: String {
        switch self {
        case .humidity:
            return String.LocalizableUIKit.weatherCellIconStateHumidity
        case .precipation:
            return String.LocalizableUIKit.weatherCellIconStatePrecipation
        case .pressure:
            return String.LocalizableUIKit.weatherCellIconStatePressure
        case .wind:
            return String.LocalizableUIKit.weatherCellIconStateWind
        case .direction:
            return String.LocalizableUIKit.weatherCellIconStateDirection
        }
    }
}

struct TodaySuccessItemView_Previews: PreviewProvider {
    static var previews: some View {
        TodaySuccessItemView(viewModel: TodayViewModel(), state: .pressure, message: "100KM/H")
    }
}
