extension CurrentWeather {
    static let exampleOfCurrentWeather = CurrentWeather(
        coord: Coord(lon: 21.0175, lat: 52.237),
        weather: [
            WeatherCurrent(id: 500, main: "Rain", description: "light rain", icon: "10d")
        ],
        base: "stations",
        main: Main(
            temp: 296.63,
            feelsLike: 296.7,
            tempMin: 295.05,
            tempMax: 299.49,
            pressure: 1014,
            humidity: 64,
            seaLevel: nil,
            grndLevel: nil
        ),
        visibility: 10000,
        wind: Wind(speed: 1.03, deg: 0, gust: nil),
        rain: Rain(the1H: 0.12),
        clouds: Clouds(all: 0),
        dt: 1_694_420_665,
        sys: Sys(
            type: 2,
            id: 2_032_856,
            country: "PL",
            sunrise: 1_694_404_984,
            sunset: 1_694_451_765
        ),
        timezone: 7200,
        id: 756_135,
        name: "Warsaw",
        cod: 200
    )
}
