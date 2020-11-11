//
//  City+Preview.swift
//  Nibble Weather
//
//  Created by gary on 11/11/2020.
//

import Foundation

#if DEBUG
extension City {
    static let city1 = City(
        id: 1,
        name: "Cumbernauld",
        dt: 123324234,
        visibility: 30,
        coord: Coord(lat: -3, lon: 55),
        weather: [
            Weather(id: 1, main: "Cloudy", description: "mainly cloudy", icon: "10d")
        ],
        main: Main(temp: 280, feelsLike: 281, pressure: 1001, humidity: 81),
        wind: Wind(speed: 3, degrees: 320),
        clouds: Clouds(all: 90),
        sys: Sys(timezone: 0, sunrise: 1656456456, sunset: 1456456456)
    )
}
#endif
