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

protocol PostFeedTableViewCellDelegate {
    func liked(id: Int, like: Bool)

    func showOptions(id: Int)
}

class PostFeedTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var messagePostLabel: UILabel!
    @IBOutlet weak var photoPostImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var optionsPostButton: UIButton!
    @IBOutlet weak var timeAgoPostLabel: UILabel!
    
    var post: PostView!
    var delegate: PostFeedTableViewCellDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
//        self.profileImageView.layer.cornerRadius = self.profileImageView.frame.height / 2
        self.selectionStyle = .none
        
    }
    
    func bind(post: PostView) {
        
        self.post = post
        self.userNameLabel.text = "@\(post.author.userName ?? "")"
        self.messagePostLabel.text = post.message.trimmingCharacters(in: .whitespacesAndNewlines)
        self.likeButton.setTitle(" " + String(post.curtidas), for: .normal)
        self.timeAgoPostLabel.text = "1h ago"
        self.likeButton.tintColor = post.curtido ? Color.red : Color.gray
        
    }
    
    
    
    @IBAction func likeAction(_ sender: Any) {
        self.delegate.liked(id: self.post.id, like: self.post.curtido)
    }
    
    
    @IBAction func optionsPostAction(_ sender: Any) {
        self.delegate.showOptions(id: self.post.id)
    }
    
    
    
}


