//
//  Colors+UINavigationsBar.swift
//

import UIKit

extension UINavigationBar {
    
    //set font
    func setTitleFont(_ font: UIFont, color: UIColor = Constants.COLOR_TITLE){
        var attrs = [NSAttributedString.Key: Any]()
        attrs[.font] = font
        attrs[.foregroundColor] = color
        titleTextAttributes = attrs
    }
    
    //transparent
    func makeTransparent(withTint tint: UIColor = Constants.COLOR_TITLE, text: UIColor = Constants.COLOR_TRANSPERENT_TITLE){
        isTranslucent = true
        backgroundColor = .clear
        barTintColor = .clear
        setBackgroundImage(UIImage(), for: .default)
        tintColor = tint
        titleTextAttributes = [.foregroundColor: text]
        shadowImage = UIImage()
    }
    
    //colored
    func setColor(background: UIColor = Constants.COLOR_NAV,text: UIColor = Constants.COLOR_TITLE){
        isTranslucent = false
        backgroundColor = background
        barTintColor = background
        setBackgroundImage(UIImage(), for: .default)
        tintColor = text
        titleTextAttributes = [.foregroundColor: text, .font: UIFont(name: Constants.MEDIUM_FONT_STYLE, size: 18.0)!]
    }
    
}
