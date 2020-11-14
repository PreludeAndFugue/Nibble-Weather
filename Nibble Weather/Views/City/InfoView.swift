//
//  InfoView.swift
//  Nibble Weather
//
//  Created by gary on 14/11/2020.
//

import SwiftUI

struct InfoView: View {
    var title: String
    var description: String


    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundColor(.secondary)
                .font(.appFont(size: 13))
            Text(description)
                .font(.appFont(size: 24))
        }
    }
}


// MARK: - Preview

#if DEBUG
struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(title: "DAY", description: "12:01")
    }
}
#endif
