//
//  PostagemService.swift
//  Treinamento-iOS
//
//  Created by administrador on 26/07/19.
//  Copyright © 2019 Treinamento. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

protocol PostagemServiceDelegate{
    
    func sucess()
    func failure(erro: String)
}

class PostagemService {
    
    var delegate: AutenticationServiceDelegate!
    
    init(delegate: AutenticationServiceDelegate) {
        self.delegate = delegate
    }
    
    func getPosts(page: Int = 1){
        PostagemRequestFactory.getPosts(page: page).validate().responseArray { (response: DataResponse<[Post]>) in
            
            switch response.result {
                
            case .success:
                if let posts = response.result.value {
                    PostViewModel.saveAll(objects: posts)
                }
                
                self.delegate.sucess()
                
            case .failure(let error):
                self.delegate.failure(error: error.localizedDescription)
            }
            
        }
    }
    
    func postCreateNewPost(message: String){
        
        PostagemRequestFactory.postCreateNewPost(message: message).validate().responseObject { (response: DataResponse<Post>) in
            
            switch response.result{
                
            case .success:
                
                if let post = response.result.value{
                    PostViewModel.save(object: post)
                }
                self.delegate.sucess()
                
            case .failure(let error):
                self.delegate.failure(error: error.localizedDescription)
            }
        }
    }
    
    func deletePost(id: Int){
        PostagemRequestFactory.deletePost(id: id).validate().responseObject { (response: DataResponse<Post>) in
            
            switch response.result{
                
            case .success:
                
                
                self.delegate.sucess()
                
            case .failure(let error):
                self.delegate.failure(error: error.localizedDescription)
                
            }
            
        }
    }
    
    func putPost(id: Int){
        
        
    }
    
    
    
}
