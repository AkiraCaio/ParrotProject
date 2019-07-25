//
//  UserViewModel.swift
//  Treinamento-iOS
//
//  Created by administrador on 25/07/19.
//  Copyright © 2019 Treinamento. All rights reserved.
//

import Foundation
import RealmSwift


struct UserView{
    var email = ""
    var userName = ""
}

class UserViewModel {
    
    static func save(object: User){
        
        self.delete()
        
        try? uiRealm.write {
            uiRealm.add(object, update: .all)
        }
    }
    
    static func delete() {
        
        let result = uiRealm.objects(User.self)
            
        try? uiRealm.write {
            uiRealm.delete(result)
        }
    }
    
}
