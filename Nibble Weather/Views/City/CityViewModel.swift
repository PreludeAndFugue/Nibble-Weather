//
//  CityViewModel.swift
//  Nibble Weather
//
//  Created by gary on 11/11/2020.
//

import SwiftUI

final class CityViewModel: ObservableObject {
    var columns: [GridItem] = Array(repeating: .init(.flexible(minimum: 100, maximum: 300)), count: 3)

    func items(for city: City) -> [(String, String)] {
        [
            ("TEMP", city.temp),
            ("FEELS LIKE", city.feelsLike),
            ("HUMIDITY", city.humidity),
            ("SUNRISE", city.sunrise),
            ("SUNSET", city.sunset),
            ("DAY", city.dayLengthText),
            ("CLOUDS", city.cloudsString),
            ("WIND", city.windSpeedGeneral),
            ("DIRECTION", city.windDirection)
        ]
    }
}
