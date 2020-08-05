//
//  RoundCorners+UIView.swift
//  Raagam
//
//  Created by DEFTeam on 08/07/20.
//  Copyright © 2020 XYZ. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func cornerRadius(usingCorners corners: UIRectCorner, cornerRadii: CGSize) {
           let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: cornerRadii)
           let maskLayer = CAShapeLayer()
           maskLayer.path = path.cgPath
           self.layer.mask = maskLayer
       }
}
