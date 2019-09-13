//
//  UIColorExtension.swift
//  HouseListApp
//
//  Created by saw pyaehtun on 11/09/2019.
//  Copyright © 2019 saw pyaehtun. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    struct MyTheme {
        static var selectedIconColor: UIColor { return UIColor(named: "selectedIconColor")!  }
        static var unSelectedIconColor : UIColor { return UIColor(named: "unSelectedIconColor")! }
//        appBackground
//        appRed
    }
    
}

extension UITableView {
    func registerForCell(strID : String) {
        register(UINib(nibName: strID, bundle: nil), forCellReuseIdentifier: strID)
    }
}


extension UICollectionView {
    func registerForCell(strID : String) {
        register(UINib(nibName: strID, bundle: nil), forCellWithReuseIdentifier: strID)
    }
}

extension NSMutableAttributedString {
    
    func addLineSpacing(alignment: NSTextAlignment = .left) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 15
        paragraphStyle.alignment = alignment
        addAttribute(.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, length))
    }
}
