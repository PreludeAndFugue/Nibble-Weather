//
//  API.swift
//  Nibble Weather
//
//  Created by gary on 11/11/2020.
//

import Foundation

final class API {
    typealias Result = Swift.Result<[City], Swift.Error>
    typealias Completion = (Result) -> Void

    enum Error: Swift.Error {
        case missingData
    }

    private let scheme = "https"
    private let host = "api.openweathermap.org"
    private let path = "/data/2.5/group"
    private let apiKey = Private.apiKey
    private let locations: [Int] = [
        // lisbon
        2267057,
        // cumbernauld
        2651715,
        // gornji milanovac
        790367,
        // bath
        2656173,
        // barcelona
        3128760
    ]

    private var completion: Completion?


    func get(completion: @escaping Completion) {
        self.completion = completion
        let task = URLSession.shared.dataTask(with: url, completionHandler: handler)
        task.resume()
    }
}


// MARK: - Private

private extension API {
    var url: URL {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = queryItems
        return components.url!
    }


    var queryItems: [URLQueryItem] {
        [
            URLQueryItem(name: "appid", value: apiKey),
            URLQueryItem(name: "id", value: locationsString)
        ]
    }


    var locationsString: String {
        locations.map({ String($0) }).joined(separator: ",")
    }


    func handler(data: Data?, response: URLResponse?, error: Swift.Error?) {
        if let error = error {
            completion?(.failure(error))
            completionOnMain(result: .failure(error))
        }
        guard let data = data else {
            completionOnMain(result: .failure(Error.missingData))
            return
        }
        do {
            let cities = try JSONDecoder().decode(Cities.self, from: data)
            completionOnMain(result: .success(cities.list))
        } catch let error {
            completionOnMain(result: .failure(error))
        }
    }


    func completionOnMain(result: Result) {
        DispatchQueue.main.async {
            self.completion?(result)
        }
    }
}
