//
//  Hex+UIColor.swift
//

import UIKit

extension UIColor {
    
    convenience init(hex: String, alpha: CGFloat = 1.0){
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        let length = hexSanitized.count
        var r: CGFloat = 0.737
        var g: CGFloat = 0.737
        var b: CGFloat = 0.737
        let a: CGFloat = alpha
        if length != 6{
            self.init(red: r, green: g, blue: b, alpha: a)
            return
        }
        var rgb: UInt32 = 0
        guard Scanner(string: hexSanitized).scanHexInt32(&rgb) else {
            self.init(red: r, green: g, blue: b, alpha: a)
            return
        }
        r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        b = CGFloat(rgb & 0x0000FF) / 255.0
        self.init(red: r, green: g, blue: b, alpha: a)
    }
    
}
