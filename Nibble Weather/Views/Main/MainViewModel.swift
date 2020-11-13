//
//  MainViewModel.swift
//  Nibble Weather
//
//  Created by gary on 11/11/2020.
//

import Foundation
import SwiftUI

final class MainViewModel: ObservableObject {
    enum State {
        case loading
        case error
        case cities
    }

    @Published var state = State.loading
    var errorMessage = ""


    func getCitiesDone(result: Database.Result) {
        switch result {
        case .failure(let error):
            self.errorMessage = error.localizedDescription
            withAnimation {
                self.state = .error
            }
        case .success:
            withAnimation {
                self.state = .cities
            }
        }
    }
}
