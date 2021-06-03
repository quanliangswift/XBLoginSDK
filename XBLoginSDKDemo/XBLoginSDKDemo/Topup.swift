//
//  Coin.swift
//  Community
//
//  Created by 全尼古拉斯 on 2020/5/20.
//  Copyright © 2020 SharpNetwork. All rights reserved.
//

import Foundation
import ObjectMapper

class TopUpItem: NSObject, Mappable {
    
    var icon: String?
    var type: String?
    var ref_name: String?
    var display_name: String?
    var display_info: String?
    var product_id: String?
    var price: Int64?
    override init() {
        super.init()
    }
  
    required init?(map: Map) {
        
    }

    func mapping(map: Map) {
        icon <- map["icon"]
        type <- map["type"]
        ref_name <- map["ref_name"]
        display_name <- map["display_name"]
        display_info <- map["display_info"]
        product_id <- map["product_id"]
        price <- map["price"]
    }
}

