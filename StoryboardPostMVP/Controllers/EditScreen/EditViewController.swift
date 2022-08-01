//
//  EditViewController.swift
//  StoryboardPostMVP
//
//  Created by Avaz Mukhitdinov on 30/07/22.
//

import UIKit

class EditViewController: BaseViewController, EditView {
    
    
    var posts : Post = Post()
    var PostID: String = "1"
    var presenter: EditPresenter!
    var editPost: Post?
    
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var bodyText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initViews()
    }
    
    
    
    // MARK: - Methods
    
    
    func initViews()  {
        initNavigation()
        
        titleText.text = editPost?.title
        bodyText.text = editPost?.body
        
        presenter = EditPresenter()
        presenter.view = self
        presenter.controller = self
    }

    func apiPostEdit(post: [Post]) {
        self.hideProgress()
        if post != nil {
            self.posts = editPost!
        }
    }
    
    
    func initNavigation() {
        title = "Edit Post MVP"
    }


    
    // MARK: - Actions

    @IBAction func editTapped(_ sender: Any) {
//        presenter.apiEditPost(post: Post(id: (editPost?.id!)!, title: titleText.text!, body: bodyText.text!))
        let post1 = Post(id: (editPost?.id!)!, title: titleText.text!, body: bodyText.text!)
            presenter?.apiEditPost(post: post1)
        
        dismiss(animated: true, completion: nil)
    }
    
}
