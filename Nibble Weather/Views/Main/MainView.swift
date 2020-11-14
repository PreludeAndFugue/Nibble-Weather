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
            .navigationBarItems(leading: refreshButton, trailing: sortButton)
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


    var sortButton: some View {
        Button(action: {}) {
            Menu(content: makeMenu, label: makeMenuLabel)
        }
    }


    func makeMenu() -> some View {
        Group {
            Button(action: sort(by: .warmest)) {
                Text("Warmest")
            }
            Button(action: sort(by: .coldest)) {
                Text("Coldest")
            }
            Button(action: sort(by: .mostSunny)) {
                Text("Most sunny")
            }
            Button(action: sort(by: .mostCloudy)) {
                Text("Most cloudy")
            }
            Button(action: sort(by: .longestDay)) {
                Text("Longest day")
            }
            Button(action: sort(by: .shortestDay)) {
                Text("Shortest day")
            }
        }
    }


    func makeMenuLabel() -> some View {
        Image(systemName: "arrow.up.arrow.down")
            .foregroundColor(.blue)
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


    func sort(by sort: Database.Sort) -> () -> () {
        { withAnimation { db.sort(by: sort) } }
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
