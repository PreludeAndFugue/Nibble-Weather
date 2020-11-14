//
//  CityView.swift
//  Nibble Weather
//
//  Created by gary on 11/11/2020.
//

import SwiftUI

struct CityView: View {
    @State var city: City
    @StateObject var viewModel = CityViewModel()


    var body: some View {
        VStack(spacing: 10) {
            Text(city.name)
                .font(.appFont(size: 34))

            HStack {
                Text(city.weatherText)
                    .font(.appFont(size: 24))

                viewModel.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                    .background(Color.lightBlue)
                    .cornerRadius(8)
            }

            HStack {
                InfoView(title: "TEMP", description: city.temp)
                Spacer()
                InfoView(title: "FEELS LIKE", description: city.feelsLike)
                Spacer()
                InfoView(title: "HUMIDITY", description: city.humidity)
            }

            HStack {
                InfoView(title: "DAY", description: city.dayLengthText)
                Spacer()
                InfoView(title: "SUNRISE", description: city.sunrise)
                Spacer()
                InfoView(title: "SUNSET", description: city.sunset)
            }

            HStack {
                InfoView(title: "CLOUDS", description: city.cloudsString)
                Spacer()
                InfoView(title: "WIND", description: city.windSpeedGeneral)
                Spacer()
                VStack(alignment: .leading) {
                    Text("DIRECTION")
                        .foregroundColor(.secondary)
                        .font(.appFont(size: 15))
                    city.windDirectionArrow
                        .font(.appFont(size: 24))
                }
            }
        }
        .padding()
        .onAppear {
            viewModel.getIcon(city)
        }
    }
}


// MARK: - Preview

#if DEBUG
struct CityView_Previews: PreviewProvider {
    static var previews: some View {
        CityView(city: .city1)
    }
}
#endif
