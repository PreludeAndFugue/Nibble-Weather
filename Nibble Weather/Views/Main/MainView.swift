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
                } else if viewModel.state == .error {
                    ErrorView(message: viewModel.errorMessage, action: viewModel.refresh)
                } else if viewModel.state == .cities {
                    CitiesView()
                }
            }
            .transition(transition)
            .navigationBarTitle("Nibble Weather", displayMode: .large)
            .navigationBarItems(
                leading: refreshButton,
                trailing: MainMenuView(action: viewModel.sort)
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
        Button(action: viewModel.refresh) {
            Image(systemName: "arrow.clockwise")
                .foregroundColor(.blue)
        }
        .padding()
    }


    func onAppear() {
        viewModel.add(db: db)
        viewModel.onAppear()
    }
}


// MARK: - Preview

#if DEBUG
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(Database())
    }
}
#endif
