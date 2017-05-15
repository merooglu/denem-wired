//
//  Makale.swift
//  deneme
//
//  Created by Mehmet Eroğlu on 15.05.2017.
//  Copyright © 2017 Mehmet Eroğlu. All rights reserved.
//

import Foundation
import ObjectMapper

class Makale: Mappable {
    
    var items = [MakaleModel]()
    
    required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        items           <- map["items"]
    }
}
