//
//  HouseTableViewCell.swift
//  HouseListApp
//
//  Created by saw pyaehtun on 12/09/2019.
//  Copyright © 2019 saw pyaehtun. All rights reserved.
//

import UIKit
import Kingfisher

class HouseTableViewCell: UITableViewCell {

    @IBOutlet weak var viewHouseImage: UIView!
    @IBOutlet weak var imgHouse: UIImageView!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblBeds: UILabel!
    @IBOutlet weak var lblArea: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    var houseVO : HouseVO? {
        didSet {
            imgHouse.kf.setImage(with: URL(string: houseVO!.houseImageUrl ?? ""))
            lblPrice.text = "$ \(houseVO?.price ?? 0)"
            lblAddress.text = houseVO?.address ?? ""
            lblBeds.text = "4 bedrooms"
            lblArea.text = "\(houseVO?.squareFeet ?? 00)"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUIs()
    }
    
    private func setUpUIs(){
        viewHouseImage.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        viewHouseImage.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
