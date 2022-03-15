//
//  PostDetailPresenter.swift
//  PostSearch
//
//  Created by Raul Kevin Aliaga Shapiama on 14/03/22.
//

import Foundation

struct PostDetailPresenter {
    
    private unowned let controller: PostDetailViewController
    private let postFetch = PostFetch()
    
    init(controller : PostDetailViewController){
        self.controller = controller
    }
    
    func didLoad() {
        self.getDetail()
    }
    
    func getDetail(){
        self.postFetch.getDetailWithAlamofire(self.controller.idDPost) { objPost in
            
            guard let objPost = objPost else {
                print("El detalle del elemento no se encuentra!")
                self.controller.showAutomaticAlertWithTitle("Error", message: "El detalle del elemento no se encuentra")
                return
            }
            self.controller.setInformation(objPost)
            print(objPost)
            print("Title:", objPost.title)
            print("Body", objPost.body)
        }
    }
}
