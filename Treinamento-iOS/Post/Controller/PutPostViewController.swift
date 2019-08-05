//
//  PutPostViewController.swift
//  Treinamento-iOS
//
//  Created by Caio Pinho on 02/08/19.
//  Copyright © 2019 Treinamento. All rights reserved.
//

import UIKit


protocol PutPostViewControllerDelegate {
    func confirmPutPost(id: Int, message: String)
}

class PutPostViewController: UIViewController {

    @IBOutlet weak var postTextView: UITextView!
    
    var post: PostView!
    
    var delegate: PutPostViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Editar Postagem"
        
        self.setupPostTextView()
    }
    
    
    func setupPostTextView(){
        postTextView.text = post.message
        self.postTextView.layer.borderWidth = 1
        self.postTextView.layer.borderColor = UIColor.black.cgColor
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func confirmAction(_ sender: Any) {
        self.delegate.confirmPutPost(id: self.post.id, message: self.postTextView.text)
        self.dismiss(animated: true)
    }
}
