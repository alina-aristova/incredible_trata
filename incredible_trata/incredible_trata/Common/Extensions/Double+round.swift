//
//  Double+round.swift
//  incredible_trata
//
//  Created by Aristova Alina on 17.11.2021.
//  
//

import Foundation

extension Double {
    func roundedString(digits: Int = 2) -> String {
        let string = String(format: "%.\(digits)f", self)
        for number in stride(from: 0, to: -digits, by: -1) {
            if string[string.index(string.endIndex, offsetBy: number - 1)] != "0" {
                return String(string[..<string.index(string.endIndex, offsetBy: number)])
            }
        }
        return String(string[..<string.index(string.endIndex, offsetBy: -digits - 1)])
    }

    func rounded(digits: Int) -> Double {
        let multiplier = pow(10.0, Double(digits))
        return (self * multiplier).rounded() / multiplier
    }
}
