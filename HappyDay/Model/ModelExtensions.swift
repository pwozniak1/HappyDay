import SwiftUI

extension WeatherCurrent {
    func calculateIcon(icon: String) -> String? {
        let iconMapping: [String: String] = [
            "01d": "ForecastSun-Light",
            "02d": "ForecastFewCloudsSun-Light",
            "03d": "ForecastCloudy-Light",
            "04d": "ForecastBrokenClouds-Light",
            "09d": "ForecastShowers-Light",
            "10d": "ForecastRain-Light",
            "11d": "ForecastThunderstorm-Light",
            "13d": "ForecastSnow-Light",
            "50d": "ForecastMist-Light",
            "01n": "ForecastMoon-Light",
            "02n": "ForecastFewCloudsMoon-Light",
            "03n": "ForecastCloudy-Light",
            "04n": "ForecastBrokenClouds-Light",
            "09n": "ForecastShowers-Light",
            "10n": "ForecastRain-Light",
            "11n": "ForecastThunderstorm-Light",
            "13n": "ForecastSnow-Light",
            "50n": "ForecastMist-Light"
        ]

        return iconMapping[icon]
    }
}

extension WeatherForecast {
    func calculateIcon(icon: String) -> String? {
        let iconMapping: [String: String] = [
            "01d": "ForecastSun-Light",
            "02d": "ForecastFewCloudsSun-Light",
            "03d": "ForecastCloudy-Light",
            "04d": "ForecastBrokenClouds-Light",
            "09d": "ForecastShowers-Light",
            "10d": "ForecastRain-Light",
            "11d": "ForecastThunderstorm-Light",
            "13d": "ForecastSnow-Light",
            "50d": "ForecastMist-Light",
            "01n": "ForecastMoon-Light",
            "02n": "ForecastFewCloudsMoon-Light",
            "03n": "ForecastCloudy-Light",
            "04n": "ForecastBrokenClouds-Light",
            "09n": "ForecastShowers-Light",
            "10n": "ForecastRain-Light",
            "11n": "ForecastThunderstorm-Light",
            "13n": "ForecastSnow-Light",
            "50n": "ForecastMist-Light"
        ]

        return iconMapping[icon]
    }
}

extension CurrentWeather {
    func convertCountryCodeToName1(countryCode: String) -> String? {
        let countryNames: [String: String] = [
            "AF": String.LocalizableUIKit.countryCodeAF,
            "AX": String.LocalizableUIKit.countryCodeAX,
            "AL": String.LocalizableUIKit.countryCodeAL,
            "DZ": String.LocalizableUIKit.countryCodeDZ,
            "AS": String.LocalizableUIKit.countryCodeAS,
            "AD": String.LocalizableUIKit.countryCodeAD,
            "AO": String.LocalizableUIKit.countryCodeAO,
            "AI": String.LocalizableUIKit.countryCodeAI,
            "AQ": String.LocalizableUIKit.countryCodeAQ,
            "AG": String.LocalizableUIKit.countryCodeAG,
            "AR": String.LocalizableUIKit.countryCodeAR,
            "AM": String.LocalizableUIKit.countryCodeAM,
            "AW": String.LocalizableUIKit.countryCodeAW,
            "AU": String.LocalizableUIKit.countryCodeAU,
            "AT": String.LocalizableUIKit.countryCodeAT,
            "AZ": String.LocalizableUIKit.countryCodeAZ,
            "BH": String.LocalizableUIKit.countryCodeBH,
            "BS": String.LocalizableUIKit.countryCodeBS,
            "BD": String.LocalizableUIKit.countryCodeBD,
            "BB": String.LocalizableUIKit.countryCodeBB,
            "BY": String.LocalizableUIKit.countryCodeBY,
            "BE": String.LocalizableUIKit.countryCodeBE,
            "BZ": String.LocalizableUIKit.countryCodeBZ,
            "BJ": String.LocalizableUIKit.countryCodeBJ,
            "BM": String.LocalizableUIKit.countryCodeBM,
            "BT": String.LocalizableUIKit.countryCodeBT,
            "BO": String.LocalizableUIKit.countryCodeBO,
            "BQ": String.LocalizableUIKit.countryCodeBQ,
            "BA": String.LocalizableUIKit.countryCodeBA,
            "BW": String.LocalizableUIKit.countryCodeBW,
            "BV": String.LocalizableUIKit.countryCodeBV,
            "BR": String.LocalizableUIKit.countryCodeBR,
            "IO": String.LocalizableUIKit.countryCodeIO,
            "BN": String.LocalizableUIKit.countryCodeBN,
            "BG": String.LocalizableUIKit.countryCodeBG,
            "BF": String.LocalizableUIKit.countryCodeBF,
            "BI": String.LocalizableUIKit.countryCodeBI,
            "KH": String.LocalizableUIKit.countryCodeKH,
            "CM": String.LocalizableUIKit.countryCodeCM,
            "CA": String.LocalizableUIKit.countryCodeCA,
            "CV": String.LocalizableUIKit.countryCodeCV,
            "KY": String.LocalizableUIKit.countryCodeKY,
            "CF": String.LocalizableUIKit.countryCodeCF,
            "TD": String.LocalizableUIKit.countryCodeTD,
            "CL": String.LocalizableUIKit.countryCodeCL,
            "CN": String.LocalizableUIKit.countryCodeCN,
            "CX": String.LocalizableUIKit.countryCodeCX,
            "CC": String.LocalizableUIKit.countryCodeCC,
            "CO": String.LocalizableUIKit.countryCodeCO,
            "KM": String.LocalizableUIKit.countryCodeKM,
            "CG": String.LocalizableUIKit.countryCodeCG,
            "CD": String.LocalizableUIKit.countryCodeCD,
            "CK": String.LocalizableUIKit.countryCodeCK,
            "CR": String.LocalizableUIKit.countryCodeCR,
            "CI": String.LocalizableUIKit.countryCodeCI,
            "HR": String.LocalizableUIKit.countryCodeHR,
            "CU": String.LocalizableUIKit.countryCodeCU,
            "CW": String.LocalizableUIKit.countryCodeCW,
            "CY": String.LocalizableUIKit.countryCodeCY,
            "CZ": String.LocalizableUIKit.countryCodeCZ,
            "DK": String.LocalizableUIKit.countryCodeDK,
            "DJ": String.LocalizableUIKit.countryCodeDJ,
            "DM": String.LocalizableUIKit.countryCodeDM,
            "DO": String.LocalizableUIKit.countryCodeDO,
            "EC": String.LocalizableUIKit.countryCodeEC,
            "EG": String.LocalizableUIKit.countryCodeEG,
            "SV": String.LocalizableUIKit.countryCodeSV,
            "GQ": String.LocalizableUIKit.countryCodeGQ,
            "ER": String.LocalizableUIKit.countryCodeER,
            "EE": String.LocalizableUIKit.countryCodeEE,
            "ET": String.LocalizableUIKit.countryCodeET,
            "FK": String.LocalizableUIKit.countryCodeFK,
            "FO": String.LocalizableUIKit.countryCodeFO,
            "FJ": String.LocalizableUIKit.countryCodeFJ,
            "FI": String.LocalizableUIKit.countryCodeFI,
            "FR": String.LocalizableUIKit.countryCodeFR,
            "GF": String.LocalizableUIKit.countryCodeGF,
            "PF": String.LocalizableUIKit.countryCodePF,
            "TF": String.LocalizableUIKit.countryCodeTF,
            "GA": String.LocalizableUIKit.countryCodeGA,
            "GM": String.LocalizableUIKit.countryCodeGM,
            "GE": String.LocalizableUIKit.countryCodeGE,
            "DE": String.LocalizableUIKit.countryCodeDE,
            "GH": String.LocalizableUIKit.countryCodeGH,
            "GI": String.LocalizableUIKit.countryCodeGI,
            "GR": String.LocalizableUIKit.countryCodeGR,
            "GL": String.LocalizableUIKit.countryCodeGL,
            "GD": String.LocalizableUIKit.countryCodeGD,
            "GP": String.LocalizableUIKit.countryCodeGP,
            "GU": String.LocalizableUIKit.countryCodeGU,
            "GT": String.LocalizableUIKit.countryCodeGT,
            "GG": String.LocalizableUIKit.countryCodeGG,
            "GN": String.LocalizableUIKit.countryCodeGN,
            "GW": String.LocalizableUIKit.countryCodeGW,
            "GY": String.LocalizableUIKit.countryCodeGY,
            "HT": String.LocalizableUIKit.countryCodeHT,
            "HM": String.LocalizableUIKit.countryCodeHM,
            "VA": String.LocalizableUIKit.countryCodeVA,
            "HN": String.LocalizableUIKit.countryCodeHN,
            "HK": String.LocalizableUIKit.countryCodeHK,
            "HU": String.LocalizableUIKit.countryCodeHU,
            "IS": String.LocalizableUIKit.countryCodeIS,
            "IN": String.LocalizableUIKit.countryCodeIN,
            "ID": String.LocalizableUIKit.countryCodeID,
            "IR": String.LocalizableUIKit.countryCodeIR,
            "IQ": String.LocalizableUIKit.countryCodeIQ,
            "IE": String.LocalizableUIKit.countryCodeIE,
            "IM": String.LocalizableUIKit.countryCodeIM,
            "IL": String.LocalizableUIKit.countryCodeIL,
            "IT": String.LocalizableUIKit.countryCodeIT,
            "JM": String.LocalizableUIKit.countryCodeJM,
            "JP": String.LocalizableUIKit.countryCodeJP,
            "JE": String.LocalizableUIKit.countryCodeJE,
            "JO": String.LocalizableUIKit.countryCodeJO,
            "KZ": String.LocalizableUIKit.countryCodeKZ,
            "KE": String.LocalizableUIKit.countryCodeKE,
            "KI": String.LocalizableUIKit.countryCodeKI,
            "KP": String.LocalizableUIKit.countryCodeKP,
            "KR": String.LocalizableUIKit.countryCodeKR,
            "KW": String.LocalizableUIKit.countryCodeKW,
            "KG": String.LocalizableUIKit.countryCodeKG,
            "LA": String.LocalizableUIKit.countryCodeLA,
            "LV": String.LocalizableUIKit.countryCodeLV,
            "LB": String.LocalizableUIKit.countryCodeLB,
            "LS": String.LocalizableUIKit.countryCodeLS,
            "LR": String.LocalizableUIKit.countryCodeLR,
            "LY": String.LocalizableUIKit.countryCodeLY,
            "LI": String.LocalizableUIKit.countryCodeLI,
            "LT": String.LocalizableUIKit.countryCodeLT,
            "LU": String.LocalizableUIKit.countryCodeLU
        ]

        return countryNames[countryCode]
    }

    func convertCountryCodeToName2(countryCode: String) -> String? {
        let countryNames: [String: String] = [
            "MO": String.LocalizableUIKit.countryCodeMO,
            "MK": String.LocalizableUIKit.countryCodeMK,
            "MG": String.LocalizableUIKit.countryCodeMG,
            "MW": String.LocalizableUIKit.countryCodeMW,
            "MY": String.LocalizableUIKit.countryCodeMY,
            "MV": String.LocalizableUIKit.countryCodeMV,
            "ML": String.LocalizableUIKit.countryCodeML,
            "MT": String.LocalizableUIKit.countryCodeMT,
            "MH": String.LocalizableUIKit.countryCodeMH,
            "MQ": String.LocalizableUIKit.countryCodeMQ,
            "MR": String.LocalizableUIKit.countryCodeMR,
            "MU": String.LocalizableUIKit.countryCodeMU,
            "YT": String.LocalizableUIKit.countryCodeYT,
            "MX": String.LocalizableUIKit.countryCodeMX,
            "FM": String.LocalizableUIKit.countryCodeFM,
            "MD": String.LocalizableUIKit.countryCodeMD,
            "MC": String.LocalizableUIKit.countryCodeMC,
            "MN": String.LocalizableUIKit.countryCodeMN,
            "ME": String.LocalizableUIKit.countryCodeME,
            "MS": String.LocalizableUIKit.countryCodeMS,
            "MA": String.LocalizableUIKit.countryCodeMA,
            "MZ": String.LocalizableUIKit.countryCodeMZ,
            "MM": String.LocalizableUIKit.countryCodeMM,
            "NA": String.LocalizableUIKit.countryCodeNA,
            "NR": String.LocalizableUIKit.countryCodeNR,
            "NP": String.LocalizableUIKit.countryCodeNP,
            "NL": String.LocalizableUIKit.countryCodeNL,
            "NC": String.LocalizableUIKit.countryCodeNC,
            "NZ": String.LocalizableUIKit.countryCodeNZ,
            "NI": String.LocalizableUIKit.countryCodeNI,
            "NE": String.LocalizableUIKit.countryCodeNE,
            "NG": String.LocalizableUIKit.countryCodeNG,
            "NU": String.LocalizableUIKit.countryCodeNU,
            "NF": String.LocalizableUIKit.countryCodeNF,
            "MP": String.LocalizableUIKit.countryCodeMP,
            "NO": String.LocalizableUIKit.countryCodeNO,
            "OM": String.LocalizableUIKit.countryCodeOM,
            "PK": String.LocalizableUIKit.countryCodePK,
            "PW": String.LocalizableUIKit.countryCodePW,
            "PS": String.LocalizableUIKit.countryCodePS,
            "PA": String.LocalizableUIKit.countryCodePA,
            "PG": String.LocalizableUIKit.countryCodePG,
            "PY": String.LocalizableUIKit.countryCodePY,
            "PE": String.LocalizableUIKit.countryCodePE,
            "PH": String.LocalizableUIKit.countryCodePH,
            "PN": String.LocalizableUIKit.countryCodePN,
            "PL": String.LocalizableUIKit.countryCodePL,
            "PT": String.LocalizableUIKit.countryCodePT,
            "PR": String.LocalizableUIKit.countryCodePR,
            "QA": String.LocalizableUIKit.countryCodeQA,
            "RE": String.LocalizableUIKit.countryCodeRE,
            "RO": String.LocalizableUIKit.countryCodeRO,
            "RU": String.LocalizableUIKit.countryCodeRU,
            "RW": String.LocalizableUIKit.countryCodeRW,
            "BL": String.LocalizableUIKit.countryCodeBL,
            "SH": String.LocalizableUIKit.countryCodeSH,
            "KN": String.LocalizableUIKit.countryCodeKN,
            "LC": String.LocalizableUIKit.countryCodeLC,
            "MF": String.LocalizableUIKit.countryCodeMF,
            "PM": String.LocalizableUIKit.countryCodePM,
            "VC": String.LocalizableUIKit.countryCodeVC,
            "WS": String.LocalizableUIKit.countryCodeWS,
            "SM": String.LocalizableUIKit.countryCodeSM,
            "ST": String.LocalizableUIKit.countryCodeST,
            "SA": String.LocalizableUIKit.countryCodeSA,
            "SN": String.LocalizableUIKit.countryCodeSN,
            "RS": String.LocalizableUIKit.countryCodeRS,
            "SC": String.LocalizableUIKit.countryCodeSC,
            "SL": String.LocalizableUIKit.countryCodeSL,
            "SG": String.LocalizableUIKit.countryCodeSG,
            "SX": String.LocalizableUIKit.countryCodeSX,
            "SK": String.LocalizableUIKit.countryCodeSK,
            "SI": String.LocalizableUIKit.countryCodeSI,
            "SB": String.LocalizableUIKit.countryCodeSB,
            "SO": String.LocalizableUIKit.countryCodeSO,
            "ZA": String.LocalizableUIKit.countryCodeZA,
            "GS": String.LocalizableUIKit.countryCodeGS,
            "SS": String.LocalizableUIKit.countryCodeSS,
            "ES": String.LocalizableUIKit.countryCodeES,
            "LK": String.LocalizableUIKit.countryCodeLK,
            "SD": String.LocalizableUIKit.countryCodeSD,
            "SR": String.LocalizableUIKit.countryCodeSR,
            "SJ": String.LocalizableUIKit.countryCodeSJ,
            "SZ": String.LocalizableUIKit.countryCodeSZ,
            "SE": String.LocalizableUIKit.countryCodeSE,
            "CH": String.LocalizableUIKit.countryCodeCH,
            "SY": String.LocalizableUIKit.countryCodeSY,
            "TW": String.LocalizableUIKit.countryCodeTW,
            "TJ": String.LocalizableUIKit.countryCodeTJ,
            "TZ": String.LocalizableUIKit.countryCodeTZ,
            "TH": String.LocalizableUIKit.countryCodeTH,
            "TL": String.LocalizableUIKit.countryCodeTL,
            "TG": String.LocalizableUIKit.countryCodeTG,
            "TK": String.LocalizableUIKit.countryCodeTK,
            "TO": String.LocalizableUIKit.countryCodeTO,
            "TT": String.LocalizableUIKit.countryCodeTT,
            "TN": String.LocalizableUIKit.countryCodeTN,
            "TR": String.LocalizableUIKit.countryCodeTR,
            "TM": String.LocalizableUIKit.countryCodeTM,
            "TC": String.LocalizableUIKit.countryCodeTC,
            "TV": String.LocalizableUIKit.countryCodeTV,
            "UG": String.LocalizableUIKit.countryCodeUG,
            "UA": String.LocalizableUIKit.countryCodeUA,
            "AE": String.LocalizableUIKit.countryCodeAE,
            "GB": String.LocalizableUIKit.countryCodeGB,
            "US": String.LocalizableUIKit.countryCodeUS,
            "UM": String.LocalizableUIKit.countryCodeUM,
            "UY": String.LocalizableUIKit.countryCodeUY,
            "UZ": String.LocalizableUIKit.countryCodeUZ,
            "VU": String.LocalizableUIKit.countryCodeVU,
            "VE": String.LocalizableUIKit.countryCodeVE,
            "VN": String.LocalizableUIKit.countryCodeVN,
            "VG": String.LocalizableUIKit.countryCodeVG,
            "VI": String.LocalizableUIKit.countryCodeVI,
            "WF": String.LocalizableUIKit.countryCodeWF,
            "EH": String.LocalizableUIKit.countryCodeEH,
            "YE": String.LocalizableUIKit.countryCodeYE,
            "ZM": String.LocalizableUIKit.countryCodeZM,
            "ZW": String.LocalizableUIKit.countryCodeZW
        ]

        return countryNames[countryCode]
    }
}