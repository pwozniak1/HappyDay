import Foundation
import SwiftUI
import UIKit

// MARK: - Welcome
struct WeatherResponse: Codable {
    let cod: String?
    let message, cnt: Int?
    let list: [ListForecast]?
    let city: CityForecast?
}

// MARK: - City
struct CityForecast: Codable {
    let id: Int?
    let name: String?
    let coord: CoordForecast?
    let country: String?
    let population, timezone, sunrise, sunset: Int?
}

// MARK: - Coord
struct CoordForecast: Codable {
    let lat, lon: Double?
}

// MARK: - List
struct ListForecast: Codable {
    let dt: Int?
    let main: MainClassForecast?
    let weather: [WeatherForecast]?
    let clouds: CloudsForecast?
    let wind: WindForecast?
    let visibility: Int?
    let pop: Double?
    let sys: SysForecast?
    let dtTxt: String?
    let rain: Rain?

    var customCurrentDate: String? {
        guard let value = dt else {
            return ""
        }

        var resultToday = NSDate(timeIntervalSince1970: TimeInterval(value))

        let utcDateFormatter = DateFormatter()
        utcDateFormatter.dateStyle = .medium

        var trimResult = utcDateFormatter.string(from: resultToday as Date)

        if trimResult.prefix(1) == 0.description {
            return String(trimResult.dropFirst())
        } else {
            return trimResult
        }
    }

    var customTimeHourValue: String? {
        guard let value = dt else {
            return ""
        }

        var resultToday = NSDate(timeIntervalSince1970: TimeInterval(value))

        let utcDateFormatter = DateFormatter()
        utcDateFormatter.timeStyle = .short

        return utcDateFormatter.string(from: resultToday as Date)
    }

    var customTimeDateValue: String {
        guard let value = dtTxt else {
            return "N/A"
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        if let date = dateFormatter.date(from: value) {
            let outputDateFormatter = DateFormatter()
            outputDateFormatter.dateFormat = "EEEE, dd MMM"
            outputDateFormatter.locale = Locale(identifier: "en_US")

            let outputDateString = outputDateFormatter.string(from: date)
            return outputDateString
        } else {
            return "N/A"
        }
    }

    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, visibility, pop, sys
        case dtTxt = "dt_txt"
        case rain
    }
}

// MARK: - Clouds
struct CloudsForecast: Codable {
    let all: Int?
}

// MARK: - MainClass
struct MainClassForecast: Codable {
    let temp, feelsLike, tempMin, tempMax: Double?
    let pressure, seaLevel, grndLevel, humidity: Int?
    let tempKf: Double?

    var customTempValue: String {
        guard let value = temp else {
            return "N/A"
        }
        let celc = value - 273.15
        let endValue = String(format: "%.0f", celc) + "℃"
        return endValue
    }

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike
        case tempMin
        case tempMax
        case pressure
        case seaLevel
        case grndLevel
        case humidity
        case tempKf
    }
}

// MARK: - Rain
struct RainForecast: Codable {
    let the3H: Double?

    enum CodingKeys: String, CodingKey {
        case the3H
    }
}

// MARK: - Sys
struct SysForecast: Codable {
    let pod: Pod?
}

enum Pod: String, Codable {
    case ddd = "d"
    case nnn = "n"
}

// MARK: - Weather
struct WeatherForecast: Codable {
    let id: Int?
    let main: MainEnum?
    let description: String?
    let icon: String?

    var customDescriptionValue: String {
        guard let value = description else {
            return "N/A"
        }

        var finalValue = ""

        if value == "moderate rain" {
            finalValue = String.LocalizableUIKit.moderateRainIconName
        } else if value == "clear sky" {
            finalValue = String.LocalizableUIKit.clearSkyIconName
        } else if value == "few clouds" {
            finalValue = String.LocalizableUIKit.fewCloudsIconName
        } else if value == "scattered clouds" {
            finalValue = String.LocalizableUIKit.scatteredCloudsIconName
        } else if value == "shower rain" {
            finalValue = String.LocalizableUIKit.showerRainIconName
        } else if value == "broken clouds" {
            finalValue = String.LocalizableUIKit.brokenCloudsIconName
        } else if value == "light rain" {
            finalValue = String.LocalizableUIKit.lightRainIconName
        } else if value == "overcast clouds" {
            finalValue = String.LocalizableUIKit.overcastCloudsIconName
        }

        let endValue = finalValue.prefix(1).capitalized + finalValue.dropFirst() + "."
        return endValue
    }

    var imageName: String? {
        guard let icon = icon else {
            return nil
        }

        return calculateIcon(icon: icon)
    }
}

enum MainEnum: String, Codable {
    case clear = "Clear"
    case clouds = "Clouds"
    case rain = "Rain"
}

// MARK: - Wind
struct WindForecast: Codable {
    let speed: Double?
    let deg: Int?
    let gust: Double?
}
