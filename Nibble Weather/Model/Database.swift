//
//  Database.swift
//  Nibble Weather
//
//  Created by gary on 13/11/2020.
//

import Combine

final class Database: ObservableObject {
    typealias Result = Swift.Result<Void, Error>
    typealias Completion = (Result) -> Void

    enum Sort {
        case warmest
        case coldest
        case mostSunny
        case mostCloudy
        case longestDay
        case shortestDay
        case mostWindy
        case leastWindy
    }

    private let api = API()
    private var completion: Completion?
    
    @Published var cities: [City] = []

    
    func getCities(completion: @escaping Completion) {
        self.completion = completion
        api.get(completion: getCitiesDone)
    }


    func sort(by sort: Sort) {
        switch sort {
        case .warmest:
            cities = cities.sorted(keyPath: \.main.temp, op: >)
        case .coldest:
            cities = cities.sorted(keyPath: \.main.temp, op: <)
        case .mostSunny:
            cities = cities.sorted(keyPath: \.clouds.all, op: <)
        case .mostCloudy:
            cities = cities.sorted(keyPath: \.clouds.all, op: >)
        case .longestDay:
            cities = cities.sorted(keyPath: \.dayLength, op: >)
        case .shortestDay:
            cities = cities.sorted(keyPath: \.dayLength, op: <)
        case .mostWindy:
            cities = cities.sorted(keyPath: \.wind.speed, op: >)
        case .leastWindy:
            cities = cities.sorted(keyPath: \.wind.speed, op: <)
        }
    }
}


// MARK: - Private

private extension Database {
    func getCitiesDone(result: API.Result) {
        switch result {
        case .failure(let error):
            completion?(.failure(error))
        case .success(let cities):
            self.cities = cities
            completion?(.success(()))
        }
        completion = nil
    }
}
