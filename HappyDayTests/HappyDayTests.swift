import Combine
@testable import HappyDay
import XCTest

final class HappyDayTests: XCTestCase {
    override func tearDown() {
        subscriptions = []
    }

    var subscriptions = Set<AnyCancellable>()

    func test_createCityAndCountryName_success() {
        let cityName1 = "Cracow"
        let countryName1 = "Poland"

        let viewModel = TodayViewModel()
        let value1 = viewModel.createCityAndCountryName(cityName: cityName1, countryName: countryName1)

        XCTAssertEqual(value1, "Cracow, Poland")

        let cityName2 = ""
        let countryName2 = "Poland"

        let value2 = viewModel.createCityAndCountryName(cityName: cityName2, countryName: countryName2)

        XCTAssertEqual(value2, "Poland")

        let cityName3 = "Cracow"
        let countryName3 = ""

        let value3 = viewModel.createCityAndCountryName(cityName: cityName3, countryName: countryName3)

        XCTAssertEqual(value3, "Cracow")

        let cityName4 = ""
        let countryName4 = ""

        let value4 = viewModel.createCityAndCountryName(cityName: cityName4, countryName: countryName4)

        XCTAssertEqual(value4, "")
    }

    func test_startAnimation_success() {
        let viewModel = TodayViewModel()

        XCTAssertEqual(viewModel.startPoint, 0.0)
        XCTAssertEqual(viewModel.endPoint, 1.0)

        viewModel.startAnimation()

        XCTAssertEqual(viewModel.startPoint, 1.0)
        XCTAssertEqual(viewModel.endPoint, 0.0)

        viewModel.startAnimation()

        XCTAssertEqual(viewModel.startPoint, 0.0)
        XCTAssertEqual(viewModel.endPoint, 1.0)
    }

    func test_loadAgainButtonErrorView_todayCase_success() async {
        let resultToday = Result<CurrentWeather, Error>.success(CurrentWeather.currentWeatherMock)

        let fetcher = TodayViewModel(service: APIMockService(resultToday: resultToday))

        fetcher.loadAgainButtonErrorView(state: .today)

        let promise = expectation(description: "Will fetch weather for today")

        fetcher
            .$todayWeather
            .sink { value in
                if value != nil {
                    promise.fulfill()
                }
            }
            .store(in: &subscriptions)

        await fulfillment(of: [promise], timeout: 2, enforceOrder: false)
    }

    func test_loadAgainButtonErrorView_todayCase_failure() async {
        let resultToday = Result<CurrentWeather, Error>.failure(WeatherError.invalidURL)

        let fetcher = TodayViewModel(service: APIMockService(resultToday: resultToday))

        fetcher.loadAgainButtonErrorView(state: .today)

        let promise = expectation(description: "Will not fetch weather for today")

        fetcher
            .$todayWeather
            .sink { value in
                if value == nil {
                    promise.fulfill()
                }
            }
            .store(in: &subscriptions)

        await fulfillment(of: [promise], timeout: 2, enforceOrder: false)
    }

    func test_loadAgainButtonErrorView_forecastCase_success() async {
        let resultForecast = Result<WeatherResponse, Error>.success(WeatherResponse.weatherResponseMock)

        let fetcher = TodayViewModel(service: APIMockService(resultForecast: resultForecast))

        fetcher.loadAgainButtonErrorView(state: .forecast)

        let promise = expectation(description: "Will fetch weather for today")

        fetcher
            .$weatherResponse
            .sink { value in
                if value?.list?.first != nil {
                    promise.fulfill()
                }
            }
            .store(in: &subscriptions)

        await fulfillment(of: [promise], timeout: 2, enforceOrder: false)
    }

    func test_loadAgainButtonErrorView_forecastCase_failure() async {
        let resultForecast = Result<WeatherResponse, Error>.failure(WeatherError.invalidURL)

        let fetcher = TodayViewModel(service: APIMockService(resultForecast: resultForecast))

        fetcher.loadAgainButtonErrorView(state: .forecast)

        let promise = expectation(description: "Will not fetch weather for today")

        fetcher
            .$weatherResponse
            .sink { value in
                if value?.list?.first == nil {
                    promise.fulfill()
                }
            }
            .store(in: &subscriptions)

        await fulfillment(of: [promise], timeout: 2, enforceOrder: false)
    }

    func test_fetchTodayData_success() async {
        let resultToday = Result<CurrentWeather, Error>.success(CurrentWeather.currentWeatherMock)

        let fetcher = TodayViewModel(service: APIMockService(resultToday: resultToday))

        await fetcher.fetchTodayData()

        let promise = expectation(description: "Fetching data for today will succeed")

        fetcher
            .$todayWeather
            .sink { value in
                if value != nil {
                    promise.fulfill()
                }
            }
            .store(in: &subscriptions)

        await fulfillment(of: [promise], timeout: 2, enforceOrder: false)
    }

    func test_fetchTodayData_failure() async {
        let resultToday = Result<CurrentWeather, Error>.failure(WeatherError.invalidURL)

        let fetcher = TodayViewModel(service: APIMockService(resultToday: resultToday))

        // "apiStateToday" property is on default .success
        XCTAssertEqual(fetcher.apiStateToday, .success)

        await fetcher.fetchTodayData()

        let promise = expectation(description: "Fetching data for today will fail")

        fetcher
            .$todayWeather
            .sink { value in
                if value == nil {
                    promise.fulfill()
                }
            }
            .store(in: &subscriptions)

        await fulfillment(of: [promise], timeout: 2, enforceOrder: false)

        XCTAssertEqual(fetcher.apiStateToday, .error)
    }

    func test_fetchForecastData_success() async {
        let resultForecast = Result<WeatherResponse, Error>.success(WeatherResponse.weatherResponseMock)

        let fetcher = TodayViewModel(service: APIMockService(resultForecast: resultForecast))

        await fetcher.fetchForecastData()

        let promise = expectation(description: "Will fetch weather data for 5 days")

        fetcher
            .$weatherResponse
            .sink { value in
                if value?.list?.first != nil {
                    promise.fulfill()
                }
            }
            .store(in: &subscriptions)

        await fulfillment(of: [promise], timeout: 2, enforceOrder: false)
    }

    func test_fetchForecastData_failure() async {
        let resultForecast = Result<WeatherResponse, Error>.failure(WeatherError.invalidURL)

        let fetcher = TodayViewModel(service: APIMockService(resultForecast: resultForecast))

        // "apiStateForecast" property is on default nil
        XCTAssertNil(fetcher.apiStateForecast)

        await fetcher.fetchForecastData()

        let promise = expectation(description: "Fetching data for 5 days forecast will fail")

        fetcher
            .$weatherResponse
            .sink { value in
                if value?.list?.first == nil {
                    promise.fulfill()
                }
            }
            .store(in: &subscriptions)

        await fulfillment(of: [promise], timeout: 2, enforceOrder: false)

        XCTAssertEqual(fetcher.apiStateForecast, .error)
    }
}
