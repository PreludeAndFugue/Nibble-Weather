//
//  MainViewModel.swift
//  Nibble Weather
//
//  Created by gary on 11/11/2020.
//

import Foundation
import Combine
import SwiftUI

final class MainViewModel: ObservableObject {
    enum State {
        case loading
        case error
        case cities
    }

    @Published var state = State.loading
    var errorMessage = ""

    private var db: Database!
    private var cancellables = Set<AnyCancellable>()


    func add(db: Database) {
        self.db = db
    }


    func onAppear() {
        db.getCities(completion: getCitiesDone(result:))
        configureTimeChange()
    }


    func refresh() {
        withAnimation {
            state = .loading
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.db.getCities(completion: self.getCitiesDone(result:))
            }
        }
    }


    func sort(by sort: Database.Sort) {
        withAnimation {
            db.sort(by: sort)
        }
    }
}


// MARK: - Private

private extension MainViewModel {
    private func getCitiesDone(result: Database.Result) {
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


    private func configureTimeChange() {
        NotificationCenter.default.publisher(for: UIApplication.significantTimeChangeNotification)
            .sink(receiveValue: timeChange(notification:))
            .store(in: &cancellables)
    }


    private func timeChange(notification: Notification) {
        refresh()
    }
}
