//
//  HouseDetailViewController.swift
//  HouseListApp
//
//  Created by saw pyaehtun on 12/09/2019.
//  Copyright © 2019 saw pyaehtun. All rights reserved.
//

import UIKit
import Kingfisher

class HouseDetailViewController: BaseViewController {
    
    @IBOutlet weak var imgHouse: UIImageView!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var imgNavigation: UIImageView!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblArea: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    var houseVO : HouseVO?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func setUpUIs() {
        imgNavigation.tintColor = UIColor.white
        imgHouse.kf.setImage(with: URL(string: houseVO?.houseImageUrl ?? ""))
        btnBack.tintColor = UIColor.white
        
        lblPrice.text = "$ \(houseVO?.price ?? 0)"
        lblAddress.text = houseVO?.address ?? ""
        lblAddress.text = "\(houseVO?.squareFeet  ?? 00)"
        lblName.text = houseVO?.name ?? ""
        
        guard let descriptionAttributeString = houseVO?.description else {
            return
        }
        
        let attributedString = NSMutableAttributedString(string: descriptionAttributeString)
        
        attributedString.addLineSpacing()
        lblDescription.attributedText = attributedString
        
    }
    
    @IBAction func btnBack(_ sender: Any) {
         self.dismiss(animated: true, completion: nil)
    }
    
}
