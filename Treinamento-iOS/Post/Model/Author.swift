//
//  Author.swift
//  Treinamento-iOS
//
//  Created by Caio Pinho on 01/08/19.
//  Copyright © 2019 Treinamento. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class Author: Object, Mappable {
    
    
    var id = RealmOptional<Int>()
    @objc dynamic var name: String?
    @objc dynamic var email: String?
    @objc dynamic var userName: String?
    @objc dynamic var photo: String?
    @objc dynamic var token: String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    func mapping(map: Map) {
        self.id.value                       <- map["id"]
        self.name                           <- map["nome"]
        self.email                          <- map["email"]
        self.userName                       <- map["username"]
        self.photo                          <- map["foto"]
    }
    
}
