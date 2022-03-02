//
//  UIColor+Init.swift
//  incredible_trata
//
//  Created by Ryabin Kirill on 19.11.2021.
//  

import UIKit

extension UIColor {
    convenience init(rgb: Int) {
//        self.init(
//            red: (rgb >> 16) & 0xFF,
//            green: (rgb >> 8) & 0xFF,
//            blue: rgb & 0xFF
//        )
        self.init(red: CGFloat((rgb >> 16) & 0xFF),
                  green: CGFloat((rgb >> 8) & 0xFF),
                  blue: CGFloat(rgb & 0xFF),
                  alpha: 0)
    }

    convenience init(red: CGFloat, green: CGFloat, blue: CGFloat) {
        self.init(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: 0)
    }
}
