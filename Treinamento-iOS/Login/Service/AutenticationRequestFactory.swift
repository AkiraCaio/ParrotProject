//
//  File.swift
//  Treinamento-iOS
//
//  Created by administrador on 25/07/19.
//  Copyright © 2019 Treinamento. All rights reserved.
//

import Foundation
import Alamofire

class AutenticationRequestFactory {
    
    static func postSingUp (name: String, userName: String, email: String, password: String) -> DataRequest {
        
        let singUp = [
            "nome" : name,
            "username" : userName,
            "email" : email,
            "password" : password
            ]
        
        return Alamofire.request(baseUrl + "/usuario", method: .post, parameters: singUp, encoding: JSONEncoding.default)
    }
    
    static func postLogin(email: String, password: String) -> DataRequest {
        
        let singIn = [
            "email" : email,
            "password" : password
        ]
        
        return Alamofire.request(baseUrl + "/usuario/login", method: .post, parameters: singIn, encoding: JSONEncoding.default)
    }
    
    static func deleteLogout() -> DataRequest{
        return Alamofire.request(baseUrl + "/usuario/logout", method: .delete, parameters: SessionControl.headers)
    }
}
