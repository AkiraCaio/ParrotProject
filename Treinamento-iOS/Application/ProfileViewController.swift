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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = L10n.Controller.Title.profile
    }
    
    
    @IBAction func configAction(_ sender: Any) {
        
    }
    
}
