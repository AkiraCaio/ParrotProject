//
//  Post.swift
//  Treinamento-iOS
//
//  Created by administrador on 26/07/19.
//  Copyright © 2019 Treinamento. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper


class Post: Object, Mappable {
    
    var id = RealmOptional<Int>()
    @objc dynamic var mensagem: String?
    var curtidas = RealmOptional<Int>()
    var criado_em = RealmOptional<Double>()
    @objc dynamic var user: User?

    
    required convenience init?(map: Map) {
        self.init()
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    func mapping(map: Map) {
        self.id.value                         <- map["id"]
        self.mensagem                         <- map["mensagem"]
        self.curtidas.value                   <- map["curtidas"]
        self.criado_em.value                  <- map["criado_em"]
        self.user                             <- map["autor"]
    }
    
}
