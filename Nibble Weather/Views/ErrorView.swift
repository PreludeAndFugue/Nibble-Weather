//
//  ErrorView.swift
//  Nibble Weather
//
//  Created by gary on 11/11/2020.
//

import SwiftUI

struct ErrorView: View {
    @State var message: String
    var action: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Text("Error")
                .font(.appFont(size: 30, weight: .medium))
            Text(message)
                .font(.appFont(size: 17))
            Button(action: reload) {
                Text("Reload")
                    .foregroundColor(.purple)
                    .font(.appFont(size: 17, weight: .medium))
            }
        }
    }
}


// MARK: - Private

private extension ErrorView {
    func reload() {
        action()
    }
}


// MARK: - Previews

#if DEBUG
struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(message: "Some error message", action: {})
    }
}
#endif
