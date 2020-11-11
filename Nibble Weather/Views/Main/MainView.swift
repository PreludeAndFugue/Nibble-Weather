//
//  MainView.swift
//  Nibble Weather
//
//  Created by gary on 11/11/2020.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()

    var body: some View {
        NavigationView {
            Group {
                if viewModel.state == .loading {
                    LoadingView()
                        .transition(.opacity)
                } else if viewModel.state == .error {
                    Text(viewModel.errorMessage)
                        .transition(.opacity)
                } else if viewModel.state == .cities {
                    CitiesView(cities: viewModel.cities)
                        .transition(.opacity)
                }
            }
            .navigationBarTitle("Nibble Weather", displayMode: .large)
            .navigationBarItems(trailing: refreshButton)
        }
        .onAppear(perform: viewModel.getCities)
    }
}


// MARK: - Private

private extension MainView {
    var refreshButton: some View {
        Button(action: refresh) {
            Image(systemName: "arrow.clockwise")
                .foregroundColor(.purple)
        }
    }


    func refresh() {
        viewModel.state = .loading
        viewModel.getCities()
    }
}


// MARK: - Preview

#if DEBUG
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
#endif
