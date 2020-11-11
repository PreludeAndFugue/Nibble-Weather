//
//  CityTests.swift
//  Nibble WeatherTests
//
//  Created by gary on 11/11/2020.
//

import XCTest
@testable import Nibble_Weather


class CityTests: XCTestCase {
    func testDecode() throws {
        let json = """
{
    "coord": {
        "lon": -9.13,
        "lat": 38.72
    },
    "weather": [
        {
            "id": 800,
            "main": "Clear",
            "description": "clear sky",
            "icon": "01n"
        }
    ],
    "base": "stations",
    "main": {
        "temp": 289.93,
        "feels_like": 290.04,
        "temp_min": 289.15,
        "temp_max": 290.37,
        "pressure": 1021,
        "humidity": 82
    },
    "visibility": 10000,
    "wind": {
        "speed": 1.5,
        "deg": 110
    },
    "clouds": {
        "all": 0
    },
    "dt": 1605117859,
    "sys": {
        "type": 1,
        "id": 6901,
        "country": "PT",
        "sunrise": 1605078889,
        "sunset": 1605115591
    },
    "timezone": 0,
    "id": 2267057,
    "name": "Lisbon",
    "cod": 200
}
"""
        let data = json.data(using: .utf8)!
        let decoder = JSONDecoder()
        let city = try! decoder.decode(City.self, from: data)
        print(city)
    }
}
