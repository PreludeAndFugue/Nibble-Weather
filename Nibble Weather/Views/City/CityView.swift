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
