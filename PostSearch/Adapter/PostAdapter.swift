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
        let cellIdentifier = "cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        
        cell.textLabel?.text = self.controller.getArrayPosts[indexPath.row].title
        
        return cell
    }
}


extension PostAdapter: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
