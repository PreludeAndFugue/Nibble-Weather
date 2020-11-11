//
//  CitiesView.swift
//  Nibble Weather
//
//  Created by gary on 11/11/2020.
//

import SwiftUI

struct CitiesView: View {
    @State var cities: [City]


    var body: some View {
        List(cities) { city in
            CityView(city: city)
        }
        .listStyle(InsetGroupedListStyle())
    }
}


// MARK: - Preview

#if DEBUG
struct CitiesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CitiesView(cities: [.city1, .city1])
        }
    }
}
#endif
