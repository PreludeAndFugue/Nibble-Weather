//
//  Font+Extension.swift
//  Nibble Weather
//
//  Created by gary on 11/11/2020.
//

import SwiftUI

extension Font {
    static func appFont(size: CGFloat, weight: Weight = .regular) -> Font {
        .system(size: size, weight: weight, design: .rounded)
    }
}
