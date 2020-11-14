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
        VStack(alignment: .leading, spacing: 10) {
            Text(city.name)
                .font(.appFont(size: 34))

            HStack {
                viewModel.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 45, height: 45)
                    .background(Color.lightBlue)
                    .cornerRadius(8)

                VStack(alignment: .leading) {
                    Text(city.weatherText)
                        .font(.appFont(size: 24))
                    Text(city.weatherDescription)
                        .foregroundColor(.secondary)
                        .font(.appFont(size: 17))
                }
            }

            LazyVGrid(columns: viewModel.columns, alignment: .leading, spacing: 10) {
                ForEach(viewModel.items(for: city), id: \.0) {
                    InfoView(title: $0.0, description: $0.1)
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
