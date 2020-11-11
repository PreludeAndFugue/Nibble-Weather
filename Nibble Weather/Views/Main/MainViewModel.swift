//
//  MainViewModel.swift
//  Nibble Weather
//
//  Created by gary on 11/11/2020.
//

import Foundation
import Combine

final class MainViewModel: ObservableObject {
    enum State {
        case loading
        case error
        case cities
    }


    private let api = API()

    @Published var state = State.loading
    var error: Error?
    var errorMessage = ""
    var cities: [City] = []

    
    func getCities() {
        api.get(completion: getCitiesDone)
    }
}


private extension MainViewModel {
    func getCitiesDone(result: API.Result) {
        switch result {
        case .failure(let error):
            print(error)
            self.error = error
            self.errorMessage = error.localizedDescription
            self.state = .error
        case .success(let cities):
            self.cities = cities
            self.state = .cities
        }
    }
}
