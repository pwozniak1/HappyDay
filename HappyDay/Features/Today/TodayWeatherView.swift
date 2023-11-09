import SwiftUI

struct TodayWeatherView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var viewModel: TodayViewModel

    var body: some View {
        Group {
            if viewModel.apiStateToday == .success {
                TabView(selection: $viewModel.currentTagSelection) {
                    TodaySuccessView(viewModel: viewModel)
                        .tabItem {
                            customTabViewItem(tabItemName: .today, tagNumber: viewModel.currentTagSelection)
                        }
                        .tag(0)

                    EmptyView()
                        .tabItem {
                            customTabViewItem(tabItemName: .forecast, tagNumber: viewModel.currentTagSelection)
                        }
                        .tag(1)
                }
                .accentColor(colorScheme == .light ? .black : .white)
            } else if viewModel.apiStateToday == .error || viewModel.apiStateToday == .loading {
                switch viewModel.apiStateToday {
                case .error:
                    EmptyView()
                default:
                    EmptyView()
                }
            }
        }
        .task {
            await viewModel.fetchTodayData()
        }
    }

    @ViewBuilder
    func customTabViewItem(tabItemName: TabItemName, tagNumber: Int) -> some View {
        switch tabItemName {
        case .forecast:
            VStack(spacing: 4) {
                tagNumber == 0 ? Image.tabBarForecastGray : Image.tabBarForecastLight
                Text(viewModel.todayWeatherViewTabItemForecast)
                    .font(.interSemiBoldSize10Weight600)
            }
        case .today:
            VStack(spacing: 4) {
                tagNumber == 0 ? Image.tabBarTodayLight : Image.tabBarTodayGray
                Text(viewModel.todayWeatherViewTabItemToday)
                    .font(.interSemiBoldSize10Weight600)
            }
        }
    }
}

extension TodayWeatherView {
    enum TabItemName {
        case forecast
        case today
    }
}

struct TodayWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        TodayWeatherView(viewModel: TodayViewModel())
    }
}
