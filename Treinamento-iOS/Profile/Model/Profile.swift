//
//  Profile.swift
//  Treinamento-iOS
//
//  Created by Caio Pinho on 05/08/19.
//  Copyright © 2019 Treinamento. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class Profile: Object, Mappable {
    
    @objc dynamic var author: Author?
    var postList = List<Post>()
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        self.author                               <- map["usuario"]
        self.postList                             <- map["postagens"]
    }
    
}
