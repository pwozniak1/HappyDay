import SwiftUI

struct TodaySuccessView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var viewModel: TodayViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(viewModel.todayWeather?.weather?.first?.customDescriptionValue ?? "")
                .kerning(-2.56)
                .font(.interBoldSize64Weight700)
                .padding(.top, 20)

            if let imageName = viewModel.todayWeather?.weather?.first?.imageName {
                Image(imageName)
                    .padding(.top, 15)
                    .padding(.bottom, 4)
            }

            Text(viewModel.todayWeather?.customTempValue ?? "")
                .font(.interSemiBoldSize32Weight600)
                .padding(.bottom, 8)

            Text("\(createCityAndCountryNameView())")
                .font(.interRegularSize16Weight400)
                .foregroundColor(.customGray)

            customSpacer
                .padding(.top, 25)
                .padding(.bottom, 25)

            VStack(alignment: .leading, spacing: 27) {
                HStack(spacing: 30) {
                    TodaySuccessItemView(viewModel: viewModel, state: .humidity, message: viewModel.todayWeather?.customHumidityValue ?? "")
                    TodaySuccessItemView(viewModel: viewModel, state: .precipation, message: viewModel.todayWeather?.customPrecipitationValue ?? "")
                    TodaySuccessItemView(viewModel: viewModel, state: .pressure, message: viewModel.todayWeather?.customPressureValue ?? "")
                }
                HStack(spacing: 30) {
                    TodaySuccessItemView(viewModel: viewModel, state: .wind, message: viewModel.todayWeather?.customWindValue ?? "")
                    TodaySuccessItemView(viewModel: viewModel, state: .direction, message: viewModel.todayWeather?.customDirectionValue ?? "")
                    Spacer()
                }
            }

            customSpacer
                .padding(.top, 26)
                .padding(.bottom, 36)

            Spacer()
        }
        .padding(.leading, 24)
        .background(
            GradientBackground(state: .yellowGradient, startPoint: $viewModel.startPoint, endPoint: $viewModel.endPoint)
                .onAppear {
                    viewModel.startAnimation()
                }
        )
    }

    func createCityAndCountryNameView() -> String {
        let cityName = viewModel.todayWeather?.name ?? ""
        let countryName = viewModel.todayWeather?.customCountryNameValue ?? ""

        let value = viewModel.createCityAndCountryName(cityName: cityName, countryName: countryName)
        return value
    }

    var customSpacer: some View {
        Rectangle()
            .fill(colorScheme == .light ? Color.customLightWhite : .white.opacity(0.1))
            .frame(height: 1)
            .padding(.trailing, 24)
    }
}

struct TodaySuccessView_Previews: PreviewProvider {
    static var previews: some View {
        TodaySuccessView(viewModel: TodayViewModel())
    }
}
