//
//  ViewController.swift
//  Treinamento-iOS
//
//  Created by Jobson Mateus on 12/07/19.
//  Copyright © 2019 Treinamento. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    
    var service: AutenticationService!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.service = AutenticationService(delegate: self)
    
    }

    @IBAction func loginAction(_ sender: Any) {
        if let email = self.emailTextField.text,
            let password = self.senhaTextField.text,
            !email.isEmpty && !password.isEmpty {
            
            self.service.postLogin(email: email, password: password)
            
        }
    
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        
        let singUpController = StoryboardScene.Main.singUpViewController.instantiate()
        
        self.navigationController?.pushViewController(singUpController, animated: true)
    }
}


extension ViewController: AutenticationServiceDelegate{
    func sucess() {
        print("Mara")
        ScreenManager.setupInitialViewController()
    }
    
    func failure(error: String) {
        print(error)
    }
}
