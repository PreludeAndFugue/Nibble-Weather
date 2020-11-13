//
//  CitiesView.swift
//  Nibble Weather
//
//  Created by gary on 11/11/2020.
//

import SwiftUI

struct CitiesView: View {
    @Environment(\.horizontalSizeClass) var hSizeClass
    @State var cities: [City]

    var body: some View {
        GeometryReader { geometryProxy in
            ScrollView {
                LazyVGrid(columns: makeColumns(geometryProxy), spacing: 20) {
                    ForEach(cities) { city in
                        CityView(city: city)
                            .overlay(border)
                    }
                }
                .padding()
            }
            .ignoresSafeArea(.all, edges: [.bottom])
        }
    }
}


private extension CitiesView {
    func makeColumns(_ geometryProxy: GeometryProxy) -> [GridItem] {
        let item = GridItem(
            .flexible(minimum: 270, maximum: 500),
            spacing: 20,
            alignment: nil
        )
        return Array(
            repeating: item,
            count: columnCount(width: geometryProxy.size.width)
        )
    }


    func columnCount(width: CGFloat) -> Int {
        print(hSizeClass, width)
        switch hSizeClass {
        case .compact:
            return width > 720 ? 2 : 1
        case .regular:
            return width > 1150 ? 3 : 2
        case .none:
            return 1
        default:
            return 1
        }
    }


    var border: some View {
        RoundedRectangle(cornerRadius: 20)
            .strokeBorder(Color("ItemBorder"), lineWidth: 2)
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
