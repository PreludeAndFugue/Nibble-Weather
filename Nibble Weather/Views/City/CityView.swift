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
                VStack() {
                    Text("TEMP")
                        .foregroundColor(.secondary)
                        .font(.appFont(size: 15))
                    Text(city.temp)
                        .font(.appFont(size: 24))
                        .padding(.bottom, 4)

                    Text("DAY")
                        .foregroundColor(.secondary)
                        .font(.appFont(size: 15))
                    Text(city.dayLengthText)
                        .font(.appFont(size: 24))
                        .padding(.bottom, 4)

                    Text("CLOUDS")
                        .foregroundColor(.secondary)
                        .font(.appFont(size: 15))
                    Text(city.cloudsString)
                        .font(.appFont(size: 24))
                }

                Spacer()

                VStack {
                    Text("FEELS LIKE")
                        .foregroundColor(.secondary)
                        .font(.appFont(size: 15))
                    Text(city.feelsLike)
                        .font(.appFont(size: 24))
                        .padding(.bottom, 4)

                    Text("SUNRISE")
                        .foregroundColor(.secondary)
                        .font(.appFont(size: 15))
                    Text(city.sunrise)
                        .font(.appFont(size: 24))
                        .padding(.bottom, 4)

                    Text("WIND")
                        .foregroundColor(.secondary)
                        .font(.appFont(size: 15))
                    Text(city.windSpeed)
                        .font(.appFont(size: 24))
                }

                Spacer()

                VStack {
                    Text("HUMIDITY")
                        .foregroundColor(.secondary)
                        .font(.appFont(size: 15))
                    Text(city.humidity)
                        .font(.appFont(size: 24))
                        .padding(.bottom, 4)

                    Text("SUNSET")
                        .foregroundColor(.secondary)
                        .font(.appFont(size: 15))
                    Text(city.sunset)
                        .font(.appFont(size: 24))
                        .padding(.bottom, 4)

                    Text("DIRECTION")
                        .foregroundColor(.secondary)
                        .font(.appFont(size: 15))
//                    Text(city.windDirection)
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
