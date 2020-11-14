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
            sortByWarmest()
        case .coldest:
            sortByColdest()
        case .mostSunny:
            sortByMostSunny()
        case .mostCloudy:
            sortByMostCloudy()
        case .longestDay:
            sortByLongestDay()
        case .shortestDay:
            sortByShortestDay()
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


    func sortByWarmest() {
        cities = cities.sorted(by: { (lhs, rhs) in lhs.main.temp > rhs.main.temp })
    }


    func sortByColdest() {
        cities = cities.sorted(by: { (lhs, rhs) in lhs.main.temp < rhs.main.temp })
    }


    func sortByMostSunny() {
        cities = cities.sorted(by: { (lhs, rhs) in lhs.clouds.all < rhs.clouds.all })
    }


    func sortByMostCloudy() {
        cities = cities.sorted(by: { (lhs, rhs) in lhs.clouds.all > rhs.clouds.all })
    }


    func sortByLongestDay() {
        cities = cities.sorted(by: { (lhs, rhs) in lhs.dayLength > rhs.dayLength })
    }


    func sortByShortestDay() {
        cities = cities.sorted(by: { (lhs, rhs) in lhs.dayLength < rhs.dayLength })
    }
}
