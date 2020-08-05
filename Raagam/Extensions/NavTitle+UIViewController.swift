//
//  NavTitle+UIViewController.swift
//

import UIKit

extension UIViewController {
    func addCustomTitleForNavigationBar(titleStr : String) {
        let navFrame = self.navigationController?.navigationBar.frame
        let lblTitle = UILabel()
        lblTitle.frame =  CGRect(x: 0, y: 0, width: (navFrame?.size.width)!-80, height: 40.0)
        lblTitle.text = titleStr
        lblTitle.textColor = UIColor.white
        lblTitle.textAlignment = .center
        lblTitle.font = UIFont(name: Constants.MEDIUM_FONT_STYLE, size: 17.0)
        self.navigationItem.titleView = lblTitle
    }
}

