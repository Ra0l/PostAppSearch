//
//  PostAdapter.swift
//  PostSearch
//
//  Created by Raul Kevin Aliaga Shapiama on 14/03/22.
//

import UIKit

protocol ListPostsViewController: NSObjectProtocol {
    func didSelectPost(_ objPost: PostResponse.DataResponse)
}

class PostAdapter: NSObject {
    
    //private unowned let controller : PostViewController //Si no le pongo private sera ciclico
    private unowned let controller : ListPostsViewController
    
    //    var arrayPosts = [PostResponse.DataResponse]()
    var arrayData = [Any]()
    
    //    init (controller : PostViewController) {
    //        self.controller = controller
    //    }
    
    init (controller : ListPostsViewController) {
        self.controller = controller
    }
    
    func initAdapterWithTableView(_ tableView: UITableView) {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension PostAdapter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.arrayData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let objPost = self.arrayData[indexPath.row] as? PostResponse.DataResponse {
            return PostTableViewCell.buildInTableView(tableView, indexPath: indexPath, objPost: objPost)
        } else if let errorMessage = self.arrayData[indexPath.row] as? String {
            return ErrorTableViewCell.buildInTableView(tableView, indexPath: indexPath, errorMessage: errorMessage)
        } else {
            return UITableViewCell()
        }
    }
}


extension PostAdapter: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let objPost = self.arrayData[indexPath.row] as? PostResponse.DataResponse {
            self.controller.didSelectPost(objPost)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if self.arrayData[indexPath.row] is PostResponse.DataResponse {
            return UITableView.automaticDimension
        } else if self.arrayData[indexPath.row] is String {
            return tableView.frame.height
        } else {
            return 0
        }
    }
}
