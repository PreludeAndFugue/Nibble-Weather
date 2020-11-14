//
//  MainView.swift
//  Nibble Weather
//
//  Created by gary on 11/11/2020.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var db: Database
    @StateObject var viewModel = MainViewModel()


    init() {
        Theme.apply()
    }

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
                    CitiesView()
                        .transition(transition)
                }
            }
            .navigationBarTitle("Nibble Weather", displayMode: .large)
            .navigationBarItems(
                leading: refreshButton,
                trailing: MainMenuView(action: sort)
            )
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear(perform: onAppear)
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
                .foregroundColor(.blue)
        }
        .padding()
    }


    func onAppear() {
        db.getCities(completion: viewModel.getCitiesDone)
    }


    func refresh() {
        withAnimation {
            viewModel.state = .loading
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                db.getCities(completion: viewModel.getCitiesDone)
            }
        }
    }


    func sort(by sort: Database.Sort) {
        withAnimation {
            db.sort(by: sort)
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
