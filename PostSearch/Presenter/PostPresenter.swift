//
//  PostViewModel.swift
//  PostSearch
//
//  Created by Raul Kevin Aliaga Shapiama on 14/03/22.
//

import Foundation
import ProgressHUD

struct PostPresenter {
    
    private unowned let controller : PostViewController //Si no le pongo private sera ciclico
    private let postFetch = PostFetch()
    
    init (controller : PostViewController) {
        self.controller = controller
    }
    
    
    func listAll() {
        
        
        
        self.controller.showLoading(true)
        
        ProgressHUD.show("Cargando")
        self.postFetch.listAllwWithAlamofire { arrayPostsResponse in
            
            self.controller.showLoading(false)
            let result: [Any] = arrayPostsResponse.data?.count != 0 ? arrayPostsResponse.data ?? [] : ["No se encontraron resultados para esta busqueda"]
            
            self.controller.reloadData(result)
            ProgressHUD.dismiss()
        }
    }
    
    func didLoad() {
        
        self.controller.initAdapters()
        self.listAll()
    }
}
