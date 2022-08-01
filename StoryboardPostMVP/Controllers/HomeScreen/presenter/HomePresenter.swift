//
//  HomePresenter.swift
//  StoryboardPostMVP
//
//  Created by Avaz Mukhitdinov on 30/07/22.
//

import Foundation

protocol HomePresenterProtocol {
    func apiPostList()
    func apiPostDelete(post: Post)
}

class HomePresenter: HomePresenterProtocol {
    
    
    var homeView: HomeView!
    var controller: BaseViewController!
    
    func apiPostList(){
        controller?.showProgress()
        AFHttp.get(url: AFHttp.API_POST_LIST, params: AFHttp.paramsEmpty(), handler: { [self] response in
            self.controller?.hideProgress()
            switch response.result{
            case .success:
                let posts = try! JSONDecoder().decode([Post].self, from: response.data!)
                self.homeView.LoedPosts(post: posts)
            case let .failure(error):
                print(error)
                self.homeView.LoedPosts(post: [Post]())
            }
        })
    }
    
    func apiPostDelete(post: Post){
        controller?.showProgress()
        
        AFHttp.del(url: AFHttp.API_POST_DELETE + post.id!, params: AFHttp.paramsEmpty(), handler: { [self] response in
            self.controller?.hideProgress()
            switch response.result{
            case .success:
                print(response.result)
                self.homeView.DeletePost(deleted: true)
            case let .failure(error):
                print(error)
                self.homeView.DeletePost(deleted: false)
            }
        })
    }
    
    
}
