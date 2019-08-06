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
    var userName = ""
    var id = -1
    var friends: [User] = []
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
    
    static func deleteAll(){
        
        try? uiRealm.write {
            uiRealm.deleteAll()
        }
        
    }
    
    static func getAsView(user: User?) -> UserView{
        guard let user = user else{
            return UserView()
        }
        
        var userView = UserView()
        
        userView.id = user.id.value ?? -1
        userView.userName = user.userName ?? ""
        
        return userView
    }
    
    static func getAsView(user: Author?) -> UserView{
        guard let user = user else{
            return UserView()
        }
        
        var userView = UserView()
        
        userView.id = user.id.value ?? -1
        userView.userName = user.userName ?? ""
        
        return userView
    }
    
}
