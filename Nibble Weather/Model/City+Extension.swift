//
//  City+Extension.swift
//  Nibble Weather
//
//  Created by gary on 11/11/2020.
//

import Foundation
import SDWebImage
import SwiftUI

private var n0: NumberFormatter = {
    let n = NumberFormatter()
    n.maximumFractionDigits = 0
    return n
}()


private var p: NumberFormatter = {
    let p = NumberFormatter()
    p.maximumFractionDigits = 0
    p.numberStyle = .percent
    return p
}()


private var t1: MeasurementFormatter = {
    let m = MeasurementFormatter()
    m.numberFormatter = n0
    m.unitStyle = .short
    return m
}()


private var d: DateFormatter = {
    let d = DateFormatter()
    d.dateStyle = .none
    d.timeStyle = .short
    return d
}()


extension City {
    var sunrise: String {
        let tz = TimeZone(secondsFromGMT: sys.timezone)
        d.timeZone = tz
        return d.string(from: _sunrise)
    }


    var sunset: String {
        let tz = TimeZone(secondsFromGMT: sys.timezone)
        d.timeZone = tz
        return d.string(from: _sunset)
    }


    var currentTime: String {
        let tz = TimeZone(secondsFromGMT: sys.timezone)
        let date = Date()
        d.timeZone = tz
        return d.string(from: date)
    }


    var temp: String {
        var measurement = Measurement(value: main.temp, unit: UnitTemperature.kelvin)
        measurement.convert(to: .celsius)
        return t1.string(from: measurement)
    }


    var feelsLike: String {
        var measurement = Measurement(value: main.feelsLike, unit: UnitTemperature.kelvin)
        measurement.convert(to: .celsius)
        return t1.string(from: measurement)
    }


    var weatherText: String {
        weather.first?.main ?? "Unknown"
    }


    var humidity: String {
        let value = Double(main.humidity) / 100.0
        let n = NSNumber(value: value)
        return p.string(from: n) ?? "?"
    }


    var url: URL? {
        guard let icon = weather.first?.icon else { return nil }
        let path = "https://openweathermap.org/img/wn/\(icon)@2x.png"
        return URL(string: path)!
    }


    var dayLength: Int {
        sys.sunset - sys.sunrise
    }


    var dayLengthText: String {
        var components = DateComponents()
        components.second = dayLength
        let f = DateComponentsFormatter()
        f.allowedUnits = [.hour, .minute]
        f.allowsFractionalUnits = true
        return f.string(from: Double(dayLength)) ?? "?"
    }
}


// MARK: - Private

private extension City {
    var _sunrise: Date {
        return Date(timeIntervalSince1970: Double(sys.sunrise))
    }


    var _sunset: Date {
        return Date(timeIntervalSince1970: Double(sys.sunset))
    }
}
