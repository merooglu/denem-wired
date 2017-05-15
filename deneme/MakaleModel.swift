//
//  MakaleModel.swift
//  deneme
//
//  Created by Mehmet Eroğlu on 15.05.2017.
//  Copyright © 2017 Mehmet Eroğlu. All rights reserved.
//

import Foundation
import ObjectMapper

class MakaleModel: Mappable {
    
    var title : String?
    var pubDate : String?
    var link : String?
    var guid : String?
    var author : String?
    var description : String?
    var content : String?
    
    required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        title               <- map["title"]
        pubDate             <- map["pubDate"]
        link                <- map["link"]
        guid                <- map["guid"]
        author              <- map["author"]
        description         <- map["description"]
        content             <- map["content"]
    }
}
