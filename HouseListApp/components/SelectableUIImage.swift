//
//  SelectableUIImage.swift
//  HouseListApp
//
//  Created by saw pyaehtun on 11/09/2019.
//  Copyright © 2019 saw pyaehtun. All rights reserved.
//

import UIKit

@IBDesignable
class SelectableUIImage: UIImageView {
    
    @IBInspectable var isSelected: Bool = false {
        didSet {
            tintColor = isSelected ? UIColor.MyTheme.selectedIconColor : UIColor.MyTheme.unSelectedIconColor
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
       self.commonInitialization()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInitialization()
    }
    
    private func commonInitialization() {
        let tapGestureRecogniser = UITapGestureRecognizer(target: self, action: #selector(didTapImage))
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tapGestureRecogniser)
    }
    
    @objc func didTapImage(){
        isSelected = !isSelected
    }
    
    func isSelected(isSelected : Bool) {
        self.isSelected = isSelected
    }
}
