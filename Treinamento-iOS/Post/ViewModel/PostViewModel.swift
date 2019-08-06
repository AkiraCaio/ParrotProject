//
//  PostViewModel.swift
//  Treinamento-iOS
//
//  Created by administrador on 26/07/19.
//  Copyright © 2019 Treinamento. All rights reserved.
//

import Foundation
import RealmSwift

struct PostView{
    var id = -1
    var author = Author()
    var curtidas = 0
    var message = ""
    var criado_em = 0.0
    var curtido = false
    
}

class PostViewModel {
    

    static func save(object: Post){
        try? uiRealm.write {
            uiRealm.add(object, update: .all)
        }
    }
    
    static func clear(){
        try? uiRealm.write{
            uiRealm.delete(uiRealm.objects(Post.self))
        }
    }
    static func saveAll (objects: [Post]){
        self.clear()
        
        try? uiRealm.write {
            uiRealm.add(objects, update: .all)
        }
    }
    
    static func deletePost(id: Int){
        if let result = uiRealm.object(ofType: Post.self, forPrimaryKey: id){
            try? uiRealm.write {
                uiRealm.delete(result)
            }
        }
    }
    
    static func getPostView(id: Int) -> PostView{
        
        let result = uiRealm.object(ofType: Post.self, forPrimaryKey: id)
        
        return self.getAsView(post: result)
    }
    
    
    static func getAsView(post: Post?) -> PostView{
        guard let post = post else{
            return PostView()
        }
        
        var postView = PostView()
        
        postView.id = post.id.value ?? -1
        postView.author = post.author ?? Author()
        postView.criado_em = post.criado_em.value ?? 0.0
        postView.curtidas = post.curtidas.value ?? 0
        postView.message = post.mensagem ?? ""
        postView.curtido = post.curtido.value ?? false
        
        return postView
    }
    
    static func getAsView(posts: [Post]) -> [PostView] {
        
        var postsView: [PostView] = []
        
        posts.forEach { (post) in
            postsView.append(self.getAsView(post: post))
        }
        
        return postsView
    }
    
    static func getAsView(posts: List<Post>) -> [PostView] {
        
        var postsView: [PostView] = []
        
        posts.forEach { (post) in
            postsView.append(self.getAsView(post: post))
        }
        
        return postsView
    }
    
    static func getAsModel(postView: PostView) -> Post {
        let post = Post()

        post.id.value = postView.id
        post.criado_em.value = postView.criado_em
        post.curtidas.value = postView.curtidas
        post.mensagem = postView.message
        post.author = postView.author
        post.curtido.value = postView.curtido
        
        return post
    }
    
    static func get() -> [Post] {
        let results = uiRealm.objects(Post.self)
        
        var posts: [Post] = []
        posts.append(contentsOf: results)
        
        return posts
    }
    
    static func getPosts() -> [PostView] {
        return self.getAsView(posts: self.get())
    }

    static func getTimeAgoPost(creatTime: Double) -> Date {
        let dateToday = Date()
        
        let creatData = Date(timeIntervalSince1970: TimeInterval(creatTime))
        
        return Date(timeIntervalSince1970: TimeInterval(dateToday.timeIntervalSince(creatData)))
        
    }

    static func getTimeAgoPost() -> String {
        
        return ""
    }
    
    
}

