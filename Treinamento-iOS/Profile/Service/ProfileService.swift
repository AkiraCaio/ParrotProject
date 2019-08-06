//
//  ProfileService.swift
//  Treinamento-iOS
//
//  Created by Caio Pinho on 06/08/19.
//  Copyright © 2019 Treinamento. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper


protocol ProfileServiceDelegate {
    
    func sucess()
    func failure(erro: String)
    
}

class ProfileService {
    
    var delegate: ProfileServiceDelegate!
    
    init(delegate: ProfileServiceDelegate) {
        self.delegate = delegate
    }

    func getProfile(id: Int){
        
        ProfileRequestFactory.getProfile(id: id).validate().responseObject { (response: DataResponse<Profile>) in
            
            switch response.result{
                
            case .success:
                
                if let profile = response.result.value{
                    ProfileViewModel.save(object: profile)
                }
                
                self.delegate.sucess()
                
            case .failure(let error):
                self.delegate.failure(erro: error.localizedDescription)
            }
        }
    }
    
    
    
}
