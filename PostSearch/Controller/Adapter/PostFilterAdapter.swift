//
//  PostFilterAdapter.swift
//  PostSearch
//
//  Created by Raul Kevin Aliaga Shapiama on 14/03/22.
//

import Foundation
import UIKit

protocol PostFilterViewController: NSObjectProtocol {
    func didPostFilterWithArray(_ arrayFilter: [Any])
}

class PostFilterAdapter: NSObject {
    
    private unowned let controller : PostFilterViewController
    
    var arrayPosts = [PostResponse.DataResponse]()
    
    init(controller : PostFilterViewController) {
        self.controller = controller
    }
    
    func initAdapterWithSearchBar(_ searchBar: UISearchBar) {
        searchBar.delegate = self
    }
}

extension PostFilterAdapter: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        let arrayResult = searchText.count == 0 ? self.arrayPosts : self.arrayPosts.filter { objPost in objPost.title!.contains(searchText) }
        
        let arrayToShow: [Any] = arrayResult.count != 0 ? arrayResult : ["No se encontro resultados de: \n \(searchText)"]
        self.controller.didPostFilterWithArray(arrayToShow)
    }
}
