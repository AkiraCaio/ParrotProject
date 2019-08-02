//
//  PostViewController.swift
//  Treinamento-iOS
//
//  Created by Caio Pinho on 29/07/19.
//  Copyright © 2019 Treinamento. All rights reserved.
//

import UIKit
import SVProgressHUD

class PostViewController: UIViewController {
    

    var posts: [PostView] = []
    
    var service: PostagemService!
    
    @IBOutlet weak var inputPostTextView: UITextView!
    @IBOutlet weak var perfilImageView: UIImageView!
    @IBOutlet weak var feedTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        self.service = PostagemService.init(delegate: self)
        
        self.perfilImageView.layer.cornerRadius = self.perfilImageView.frame.height/2
        
        self.feedTableView.delegate = self
        self.feedTableView.dataSource = self
        self.feedTableView.register(cellType: PostFeedTableViewCell.self)
//        self.feedTableView.estimatedRowHeight = 800
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.loadData()
    }
    
    
    func loadData(){
        SVProgressHUD.setDefaultStyle(.dark)
        SVProgressHUD.show()
        self.service.getPosts()
    }

    @IBAction func sendAction(_ sender: Any) {
        service.postCreateNewPost(message: inputPostTextView.text)
        
        inputPostTextView.text = ""
    }
    
    @IBAction func imageLoadAction(_ sender: Any) {
//        UIAlertController
    }
}

extension PostViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = feedTableView.dequeueReusableCell(for: indexPath) as PostFeedTableViewCell
        
        cell.bind(post: self.posts[indexPath.row])
        cell.delegate = self
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNonzeroMagnitude
    }
}

extension PostViewController: PostagemServiceDelegate {
    func sucess() {

        self.posts = PostViewModel.getPosts()
        self.feedTableView.reloadData()
        SVProgressHUD.dismiss()
    }
    
    func failure(erro: String) {
        print(erro)
        SVProgressHUD.dismiss()
    }
    
    
}

extension PostViewController: PostFeedTableViewCellDelegate{
    func showOptions(id: Int) {
        
        let actionSheet = UIAlertController(title: "", message: "Escolha uma opcao", preferredStyle: .actionSheet)
        
        let cancel = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        let putPost = UIAlertAction(title: "Alterar postagem", style: .default) { (action) in
            
        }
        
        let deletePost = UIAlertAction(title: "Deletar postagem", style: .default) { (action) in
            self.service.deletePost(id: id)
        }
        
        actionSheet.addAction(putPost)
        actionSheet.addAction(deletePost)
        actionSheet.addAction(cancel)
        
        self.present(actionSheet, animated: true)
        
    }
    
    func liked(id: Int, like: Bool) {
        self.service.likePost(id: id, like: like)

    }
}
