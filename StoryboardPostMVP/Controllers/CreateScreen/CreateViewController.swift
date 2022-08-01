//
//  CreateViewController.swift
//  StoryboardPostMVP
//
//  Created by Avaz Mukhitdinov on 30/07/22.
//

import UIKit

class CreateViewController: BaseViewController, CreateView {

    
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var bodyText: UITextField!
    var presenter: CreatePresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initViews()
        title = "Create Post"
    }


    func initViews(){
        
        presenter = CreatePresenter()
        presenter.CreateView = self
        presenter.controller = self
    }
    
    func onCreateContact(posts: [Post]) {}
 
    // MARK: - Methods

    @IBAction func createTapped(_ sender: Any) {
        presenter?.apiPostCreate(post: Post(title: titleText.text!, body: bodyText.text!))
                                 
        self.navigationController?.popToRootViewController(animated: true)
    }
}
