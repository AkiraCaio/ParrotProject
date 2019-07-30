//
//  PostFeedTableViewCell.swift
//  Treinamento-iOS
//
//  Created by Caio Pinho on 29/07/19.
//  Copyright © 2019 Treinamento. All rights reserved.
//

import UIKit
import Reusable
import Kingfisher

class PostFeedTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var messagePostLabel: UILabel!
    @IBOutlet weak var photoPostImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var timeAgoPostLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
//        self.profileImageView.layer.cornerRadius = self.profileImageView.frame.height / 2
        
    }
    
    func bind(post: PostView) {
        self.userNameLabel.text = "@\(post.user.userName ?? "")"
        self.messagePostLabel.text = post.message
        self.likeButton.setTitle(String(post.curtidas), for: .normal)
        self.timeAgoPostLabel.text = "1h ago"
        self.userNameLabel.text = "@Matela Love"
    }
    
    @IBAction func likeAction(_ sender: Any) {
    }
    @IBAction func optionsPostAction(_ sender: Any) {
    }
    
    
}

