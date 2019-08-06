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
            uiRealm.add(object, update: .error)
        }
    }
    
    static func delete() {
        
        let result = uiRealm.objects(Profile.self)
        
        try? uiRealm.write {
            uiRealm.delete(result)
        }
    }
    
    static func getProfile(id: Int) -> ProfileView{
        let results = uiRealm.objects(Profile.self).filter({$0.author?.id.value ?? 0 == id})
        
        return self.getAsView(profile: results.first)
    }
    
    
    static func getAsView(profile: Profile?) -> ProfileView{
        guard let profile = profile else{
            return ProfileView()
        }
        
        var profileView = ProfileView()
        
        profileView.author = UserViewModel.getAsView(user: profile.author)
        profileView.postagens = PostViewModel.getAsView(posts: profile.postList)

        return profileView
    }
    
    
    
    
    
}
