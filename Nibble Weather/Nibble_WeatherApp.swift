//
//  Nibble_WeatherApp.swift
//  Nibble Weather
//
//  Created by gary on 11/11/2020.
//

import SwiftUI

@main
struct Nibble_WeatherApp: App {
    let db = Database()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(db)
        }
    }
}
