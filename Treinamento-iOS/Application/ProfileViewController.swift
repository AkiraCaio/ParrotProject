//
//  ProfileViewController.swift
//  Treinamento-iOS
//
//  Created by Caio Pinho on 05/08/19.
//  Copyright © 2019 Treinamento. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var friendsLabel: UILabel!
    @IBOutlet weak var configButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    
    var service: ProfileService!
    var profile: ProfileView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.service = ProfileService(delegate: self)
        
        self.title = L10n.Controller.Title.profile
        self.configButton.layer.cornerRadius = 10
        
        
    }
    
    
    
    
    @IBAction func configAction(_ sender: Any) {
        
    }
    
}


extension ProfileViewController: ProfileServiceDelegate {
    func sucess() {
        self.profile.author = ProfileViewModel.getAuthorView(id: profile.author.id)
    }
    
    func failure(erro: String) {
        print(erro)
    }
    
    
}
