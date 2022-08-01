//
//  editPresenter.swift
//  StoryboardPostMVP
//
//  Created by Avaz Mukhitdinov on 30/07/22.
//

import Foundation

protocol EditPresenterProtocol {
    func apiEditPost(post: Post)
}

class EditPresenter: EditPresenterProtocol{
    
    var view: EditView!
    var controller: BaseViewController!
    
    func apiEditPost(post: Post){
        controller?.showProgress()
        AFHttp.put(url: AFHttp.API_POST_UPDATE + post.id!, params: AFHttp.paramsPostUpdate(post: post), handler: { response in
            self.controller?.hideProgress()
            switch response.result{
            case .success:
                print(response.result)
                
            case let .failure(error):
                print(error)
            }
        })
    }
    
    
}

