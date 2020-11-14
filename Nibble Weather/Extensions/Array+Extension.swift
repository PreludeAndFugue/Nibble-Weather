//
//  Array+Extension.swift
//  Nibble Weather
//
//  Created by gary on 14/11/2020.
//

import Foundation

extension Array where Element == City {
    func sorted<T: Comparable>(keyPath: KeyPath<Element, T>, op: (T, T) -> Bool) -> [City] {
        sorted(by: { (lhs, rhs) in op(lhs[keyPath: keyPath], rhs[keyPath: keyPath]) })
    }
}
