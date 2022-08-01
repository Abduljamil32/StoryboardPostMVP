import Foundation

protocol CreatePresenterProtocol{
    func apiPostCreate(post: Post)
}

class CreatePresenter: CreatePresenterProtocol{
    
    var CreateView: CreateView?
    var controller: BaseViewController?
    
    func apiPostCreate(post: Post) {
        controller?.showProgress()
        AFHttp.post(url: AFHttp.API_POST_CREATE, params: AFHttp.paramsPostCreate(post: post), handler: { response in
            switch response.result {
            case .success:
                self.controller?.hideProgress()
                
                print(response.result)
            case let .failure(error):
                print(error)
            }
        })
    }
}
