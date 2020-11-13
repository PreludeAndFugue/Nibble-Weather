//
//  Theme.swift
//  Nibble Weather
//
//  Created by gary on 12/11/2020.
//

import UIKit

struct Theme {
    static func apply() {
        let n = UINavigationBar.appearance()
        n.largeTitleTextAttributes = [
            .font: UIFont.rounded(ofSize: 32, weight: .semibold)
        ]
        n.titleTextAttributes = [
            .font: UIFont.rounded(ofSize: 20, weight: .medium)
        ]
    }
}
