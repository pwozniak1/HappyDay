import Foundation
import SwiftUI
import UIKit

// MARK: - CurrentWeather
struct CurrentWeather: Codable {
    let coord: Coord?
    let weather: [WeatherCurrent]?
    let base: String?
    let main: Main?
    let visibility: Int?
    let wind: Wind?
    let rain: Rain?
    let clouds: Clouds?
    let dt: Int?
    let sys: Sys?
    let timezone, id: Int?
    let name: String?
    let cod: Int?

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

    var customCountryNameValue: String? {
        guard let value = sys?.country else {
            return ""
        }
        let convertedValue1 = convertCountryCodeToName1(countryCode: value)

        if let convertedValue1 = convertedValue1 {
            return convertedValue1
        } else {
            let convertedValue2 = convertCountryCodeToName2(countryCode: value)
            return convertedValue2 ?? ""
        }
    }

    var customImageValue: String {
        guard let value = main?.humidity else {
            return "N/A"
        }
        return "\(value)%"
    }

    var customTempValue: String {
        guard let value = main?.temp else {
            return "N/A"
        }
        let celc = value - 273.15
        let endValue = String(format: "%.0f", celc) + "℃"
        return endValue
    }

    var customHumidityValue: String {
        guard let value = main?.humidity else {
            return "N/A"
        }
        return "\(value)%"
    }

    var customPrecipitationValue: String {
        guard let value = rain?.the1H else {
            return "N/A"
        }
        let endValue = String(format: "%.1f", value) + "MM"
        return endValue
    }

    var customPressureValue: String {
        guard let value = main?.pressure else {
            return "N/A"
        }
        return "\(value) hPa"
    }

    var customWindValue: String {
        guard let value = wind?.speed else {
            return "N/A"
        }
        let endValue = String(format: "%.0f", value) + "KM/H"
        return endValue
    }

    var customDirectionValue: String {
        guard let degrees = wind?.deg else {
            return "N/A"
        }
        switch degrees {
        case 0..<23:
            return "N"
        case 23..<68:
            return "NE"
        case 68..<113:
            return "E"
        case 113..<158:
            return "SE"
        case 158..<203:
            return "S"
        case 203..<248:
            return "SW"
        case 248..<293:
            return "W"
        case 293..<338:
            return "NW"
        default:
            return "N"
        }
    }
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int?
}

// MARK: - Coord
struct Coord: Codable {
    let lon, lat: Double?
}

// MARK: - Main
struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double?
    let pressure, humidity, seaLevel, grndLevel: Int?

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike
        case tempMin
        case tempMax
        case pressure, humidity
        case seaLevel
        case grndLevel
    }
}

// MARK: - Rain
struct Rain: Codable {
    let the1H: Double?

    enum CodingKeys: String, CodingKey {
        case the1H
    }
}

// MARK: - Sys
struct Sys: Codable {
    let type, id: Int?
    let country: String?
    let sunrise, sunset: Int?
}

// MARK: - WeatherCurrent
struct WeatherCurrent: Codable {
    let id: Int?
    let main, description, icon: String?

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

// MARK: - Wind
struct Wind: Codable {
    let speed: Double?
    let deg: Int?
    let gust: Double?
}
