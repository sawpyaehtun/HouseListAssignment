//
//  HouseVO.swift
//  HouseListApp
//
//  Created by saw pyaehtun on 12/09/2019.
//  Copyright © 2019 saw pyaehtun. All rights reserved.
//

import Foundation

struct HouseVO : Codable {
    var id : Int?
    var houseImageUrl : String?
    var name : String?
    var description : String?
    var price : Int?
    var address : String?
    var squareFeet : Int?
    var latitude : Double?
    var longitude : Double?
}

