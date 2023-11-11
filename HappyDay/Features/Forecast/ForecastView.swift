import SwiftUI

struct ForecastView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var viewModel: TodayViewModel

    var body: some View {
        Group {
            switch viewModel.apiStateForecast {
            case .success:
                BasicUIViewControllerRepresentable(viewModel: viewModel)
            case .error:
                TodayErrorView(viewModel: viewModel, state: .forecast)
            default:
                Rectangle()
                    .fill(colorScheme == .light ? .white : .black)
                    .ignoresSafeArea()
            }
        }
        .task {
            await viewModel.fetchForecastData()
        }
    }
}

struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastView(viewModel: TodayViewModel())
    }
}
