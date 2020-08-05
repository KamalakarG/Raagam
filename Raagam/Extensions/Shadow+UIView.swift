//
//  Shadow+UIView.swift
//

import UIKit

extension UIView {
    
    func drawShadow(withColor color: UIColor = Constants.COLOR_SHADOW, opacity: Float = 0.8, width: CGFloat = 0, height: CGFloat = 3, radius: CGFloat = 4){
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        let offSet = CGSize(width: width, height: height)
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
    }
    
}
