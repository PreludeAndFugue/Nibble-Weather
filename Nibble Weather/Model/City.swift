//
//  City.swift
//  Nibble Weather
//
//  Created by gary on 11/11/2020.
//

import Foundation

struct City: Codable, Identifiable {
    struct Coord: Codable {
        let lat: Double
        let lon: Double
    }

    struct Weather: Codable {
        let id: Int
        let main: String
        let description: String
        let icon: String
    }

    struct Main: Codable {
        enum CodingKeys: String, CodingKey {
            case temp
            case feelsLike = "feels_like"
            case pressure
            case humidity
        }
        
        let temp: Double
        let feelsLike: Double
        let pressure: Int
        let humidity: Int
    }

    struct Wind: Codable {
        enum CodingKeys: String, CodingKey {
            case speed
            case degrees = "deg"
        }

        let speed: Double
        let degrees: Int
    }

    struct Clouds: Codable {
        let all: Int
    }

    struct Sys: Codable {
        let timezone: Int
        let sunrise: Int
        let sunset: Int
    }

    let id: Int
    let name: String
    let dt: Int
    let visibility: Int
    let coord: Coord
    let weather: [Weather]
    let main: Main
    let wind: Wind
    let clouds: Clouds
    let sys: Sys
}
