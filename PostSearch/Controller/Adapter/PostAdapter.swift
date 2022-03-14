//
//  PostAdapter.swift
//  PostSearch
//
//  Created by Raul Kevin Aliaga Shapiama on 14/03/22.
//

import UIKit

class PostAdapter: NSObject {
    
    private unowned let controller : PostViewController //Si no le pongo private sera ciclico
    
    init (controller : PostViewController) {
        self.controller = controller
    }
    
    func initAdapter() {
        self.controller.getTlbPosts.delegate = self
        self.controller.getTlbPosts.dataSource = self
    }
}

extension PostAdapter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.controller.getArrayPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let objPost = self.controller.getArrayPosts[indexPath.row]
        return PostTableViewCell.buildInTableView(tableView, indexPath: indexPath, objPost: objPost)
    }
}


extension PostAdapter: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
