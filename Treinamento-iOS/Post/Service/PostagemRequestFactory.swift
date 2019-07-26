//
//  PostagemRequestFactory.swift
//  Treinamento-iOS
//
//  Created by administrador on 26/07/19.
//  Copyright © 2019 Treinamento. All rights reserved.
//

import Foundation
import Alamofire

class PostagemRequestFactory{
    
    
    static func getPosts(page: Int) -> DataRequest{
    
        let page = [
            "pagina": page
        ]
        
        return Alamofire.request(baseUrl + "/postagem", method: .get, parameters: page, headers: SessionControl.headers)
    }
    
    static func postCreateNewPost(message: String) -> DataRequest{
        
        let mensagem = [
            "mensagem": message
        ]
        
        return Alamofire.request(baseUrl + "/postagem", method: .post, parameters: mensagem, encoding: JSONEncoding.default, headers: SessionControl.headers)
    }
    
    static func deletePost(id: Int) -> DataRequest {
        
        return Alamofire.request(baseUrl + "/postagem/" + String(id), method: .delete, headers: SessionControl.headers)
    }
    
    
//    static func putPost(id: Int) -> DataRequest{
//        
//        
//        
//        return nil
//        
//    }
}
