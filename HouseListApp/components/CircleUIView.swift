//
//  CircleUIView.swift
//  HouseListApp
//
//  Created by saw pyaehtun on 12/09/2019.
//  Copyright © 2019 saw pyaehtun. All rights reserved.
//

import UIKit

@IBDesignable
class CircleUIView: UIView {
    
    var cornerRadius : CGFloat = 0
    @IBInspectable var shadowOffsetWidth : Int = 0
    @IBInspectable var shadowOffsetHeight : Int = 0
    @IBInspectable var showColor : UIColor? = UIColor.black
    @IBInspectable var shadowOpacity : Float = 0.5
    @IBInspectable var borderWidth :  CGFloat = 0.0
    @IBInspectable var borderColor :  UIColor? = UIColor.black

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInitializatioln()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInitializatioln()
    }
    
    private func commonInitializatioln(){
        cornerRadius = self.frame.height / 2
    }
    
    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        
        layer.masksToBounds = false
        layer.shadowColor = showColor?.cgColor
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = shadowPath.cgPath
    }
}
