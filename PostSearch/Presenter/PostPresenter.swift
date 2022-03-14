//
//  PostViewModel.swift
//  PostSearch
//
//  Created by Raul Kevin Aliaga Shapiama on 14/03/22.
//

import Foundation

struct PostPresenter {
    
    private unowned let controller : PostViewController //Si no le pongo private sera ciclico
    private let postFetch = PostFetch()
    
    init (controller : PostViewController) {
        self.controller = controller
    }
    
    
    private func listAll() {
        
        self.postFetch.listAllwWithAlamofire { arrayPostsResponse in
            self.controller.reloadData(arrayPostsResponse.data ?? [])
        }
    }
    
    func didLoad() {
        
        self.controller.initAdapter()
        self.listAll()
    }
}
