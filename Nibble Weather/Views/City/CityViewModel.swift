//
//  CityViewModel.swift
//  Nibble Weather
//
//  Created by gary on 11/11/2020.
//

import SwiftUI
import SDWebImage

final class CityViewModel: ObservableObject {
    @Published var image = Image(systemName: "questionmark")

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

    func getIcon(_ city: City) {
        guard let url = city.url else { return }
        SDWebImageManager.shared.loadImage(
            with: url,
            options: [],
            progress: nil,
            completed: getIconDone
        )
    }
}


// MARK: - Private

private extension CityViewModel {
    func getIconDone(uiImage: UIImage?, data: Data?, error: Error?, cacheType: SDImageCacheType, finished: Bool, url: URL?) {
        guard let uiImage = uiImage else { return }
        image = Image(uiImage: uiImage)
    }
}
