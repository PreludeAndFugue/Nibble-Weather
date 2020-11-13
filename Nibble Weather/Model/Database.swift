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

    private let api = API()
    private var completion: Completion?
    
    @Published var cities: [City] = []

    
    func getCities(completion: @escaping Completion) {
        self.completion = completion
        api.get(completion: getCitiesDone)
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
