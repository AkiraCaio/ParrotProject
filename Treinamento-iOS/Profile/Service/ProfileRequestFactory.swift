//
//  ProfileRequestFactory.swift
//  Treinamento-iOS
//
//  Created by Caio Pinho on 06/08/19.
//  Copyright © 2019 Treinamento. All rights reserved.
//

import Foundation
import Alamofire

class ProfileRequestFactory{
    
    static func getProfile(id: Int) -> DataRequest{
        return Alamofire.request(baseUrl + "/usuario/\(id)", method: .get, headers: SessionControl.headers)
    }
    

   
    
    
}
