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
                        .transition(transition)
                } else if viewModel.state == .error {
                    ErrorView(message: viewModel.errorMessage, action: refresh)
                        .transition(transition)
                } else if viewModel.state == .cities {
                    CitiesView(cities: viewModel.cities)
                        .transition(transition)
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
    var transition: AnyTransition {
        AnyTransition.opacity
    }


    var refreshButton: some View {
        Button(action: refresh) {
            Image(systemName: "arrow.clockwise")
                .foregroundColor(.purple)
        }
    }


    func refresh() {
        withAnimation {
            viewModel.state = .loading
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                viewModel.getCities()
            }
        }
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
