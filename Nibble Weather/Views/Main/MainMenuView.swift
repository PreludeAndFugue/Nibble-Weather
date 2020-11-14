//
//  MainMenuView.swift
//  Nibble Weather
//
//  Created by gary on 14/11/2020.
//

import SwiftUI

struct MainMenuView: View {
    var action: (Database.Sort) -> Void


    var body: some View {
        Menu(content: makeMenu, label: makeMenuLabel)
    }


    func makeMenu() -> some View {
        Group {
            Button(action: sort(by: .warmest)) {
                Image(systemName: "thermometer.sun")
                    .foregroundColor(.warmHighlight)
                Text("Warmest")
            }
            Button(action: sort(by: .coldest)) {
                Image(systemName: "thermometer.snowflake")
                    .foregroundColor(.coldHighlight)
                Text("Coldest")
            }
            Button(action: sort(by: .mostSunny)) {
                Image(systemName: "sun.max")
                    .foregroundColor(.warmHighlight)
                Text("Most sunny")
            }
            Button(action: sort(by: .mostCloudy)) {
                Image(systemName: "cloud")
                    .foregroundColor(.coldHighlight)
                Text("Most cloudy")
            }
            Button(action: sort(by: .longestDay)) {
                Image(systemName: "tortoise")
                    .foregroundColor(.green)
                Text("Longest day")
            }
            Button(action: sort(by: .shortestDay)) {
                Image(systemName: "hare")
                Text("Shortest day")
            }
            Button(action: sort(by: .mostWindy)) {
                Image(systemName: "tornado")
                Text("Most windy")
            }
            Button(action: sort(by: .leastWindy)) {
                Image(systemName: "wind")
                Text("Least windy")
            }
        }
    }


    func makeMenuLabel() -> some View {
        Image(systemName: "arrow.up.arrow.down")
            .foregroundColor(.blue)
    }


    func sort(by sort: Database.Sort) -> () -> () {
        { action(sort) }
    }
}


// MARK: - Preview

#if DEBUG
struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView(action: { _ in })
    }
}
#endif
