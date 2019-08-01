//
//  AutenticationService.swift
//  Treinamento-iOS
//
//  Created by administrador on 25/07/19.
//  Copyright © 2019 Treinamento. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper


protocol AutenticationServiceDelegate {
    
    func sucess()
    func failure(error: String)
}

class AutenticationService {
    
    var delegate: AutenticationServiceDelegate!
    
    init(delegate: AutenticationServiceDelegate) {
        self.delegate = delegate
    }
    
    func postSingUp (name: String, userName: String, email: String, password: String){
    
        AutenticationRequestFactory.postSingUp(name: name, userName: userName, email: email, password: password).validate().responseObject { (response: DataResponse<User>) in
            
            switch response.result{
                
            case .success:
                
                if let user = response.result.value {
                    
                    if let token = response.response?.allHeaderFields["token"] as? String {
                        user.token = token

                        UserViewModel.save(object: user)

                        SessionControl.setHeaders()

                    }
                }
                
                self.delegate.sucess()
                
            case .failure(let error):
            
                self.delegate.failure(error: error.localizedDescription)
            }
        }
    }
    
    func postLogin(email: String, password: String) {
        
        AutenticationRequestFactory.postLogin(email: email, password: password).validate().responseObject { (response: DataResponse<User>) in
            
            switch response.result{
                
            case .success:
                
                if let user = response.result.value {
                    
                    if let token = response.response?.allHeaderFields["token"] as? String{
                        user.token = token
                        
                        UserViewModel.save(object: user)
                        
                        SessionControl.setHeaders()
                    }
                }
                self.delegate.sucess()
                
            case .failure(let error):
                self.delegate.failure(error: error.localizedDescription)
            }
        }
    }
    
    func deleteLogout(){
        
        AutenticationRequestFactory.deleteLogout().validate().responseObject { (response: DataResponse<User>) in
            
            self.delegate.sucess()
            UserViewModel.deleteAll()

        }
    
    }
}
