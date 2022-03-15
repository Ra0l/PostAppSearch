//
//  PostTableViewCell.swift
//  PostSearch
//
//  Created by Raul Kevin Aliaga Shapiama on 14/03/22.
//

import Foundation
import UIKit

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    
    fileprivate var objPost: PostResponse.DataResponse! {
        didSet { self.updateData() }
    }
   
    func updateData() {
        self.lblTitle.text = self.objPost.title
    }
}

//MARK: -- Builder
extension PostTableViewCell {
    
    class func buildInTableView(_ tableView: UITableView, indexPath: IndexPath, objPost: PostResponse.DataResponse) -> PostTableViewCell {
        
        let cellIdentifier = "PostTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? PostTableViewCell else {
            return PostTableViewCell()
        }
        cell.objPost = objPost
        return cell
    }
}
