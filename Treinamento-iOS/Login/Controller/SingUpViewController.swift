//
//  SingUpViewController.swift
//  Treinamento-iOS
//
//  Created by administrador on 25/07/19.
//  Copyright © 2019 Treinamento. All rights reserved.
//

import UIKit

class SingUpViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nickNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    var service: AutenticationService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.service = AutenticationService.init(delegate: self)
    }
    
    @IBAction func singUpAction(_ sender: Any) {
        
        if let name = self.nameTextField.text,
            let nickName = self.nickNameTextField.text,
            let email = self.emailTextField.text,
            let password = self.passwordTextField.text,
            let confirmPassword = self.confirmPasswordTextField.text,
            !name.isEmpty && !nickName.isEmpty && !email.isEmpty && !password.isEmpty && !confirmPassword.isEmpty && password == confirmPassword{
            
            self.service.postSingUp(name: name, userName: nickName, email: email, password: password)
        }
    }
}


extension SingUpViewController: AutenticationServiceDelegate{
    func sucess() {
        
        self.dismiss(animated: true){
            ScreenManager.setupInitialViewController()
        }
    }
    
    func failure(error: String) {
        print(error)
    }
    
    
}
