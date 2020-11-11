//
//  LoadingView.swift
//  Nibble Weather
//
//  Created by gary on 11/11/2020.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView() {
            Text("Loading")
                .font(.appFont(size: 17))
        }
    }
}


// MARK: - Previews

#if DEBUG
struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
#endif
