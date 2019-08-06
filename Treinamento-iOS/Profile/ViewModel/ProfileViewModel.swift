//
//  ProfileViewModel.swift
//  Treinamento-iOS
//
//  Created by Caio Pinho on 06/08/19.
//  Copyright © 2019 Treinamento. All rights reserved.
//

import Foundation
import RealmSwift

struct ProfileView{
    var author = UserView()
    var postagens: [PostView] = []
}

class ProfileViewModel{
    
    static func save(object: Profile){
        
        self.delete()
        
        try? uiRealm.write {
            uiRealm.add(object, update: .all)
        }
    }
    
    static func delete() {
        
        let result = uiRealm.objects(Profile.self)
        
        try? uiRealm.write {
            uiRealm.delete(result)
        }
    }
    
    
    
    
    
}
