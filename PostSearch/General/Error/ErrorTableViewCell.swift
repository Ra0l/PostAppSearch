//
//  ErrorTableViewCell.swift
//  PostSearch
//
//  Created by Raul Kevin Aliaga Shapiama on 14/03/22.
//

import Foundation
import UIKit

class ErrorTableViewCell: UITableViewCell {
    
    @IBOutlet weak private var lblErrorMessage: UILabel!
    
    var errorMessage: String! {
        didSet {
            self.updateData()
        }
    }
    
    private func updateData() {
        self.lblErrorMessage.text = self.errorMessage
    }
}


//MARK: -- Builder
extension ErrorTableViewCell {
    
    class func buildInTableView(_ tableView: UITableView, indexPath: IndexPath, errorMessage: String) -> ErrorTableViewCell {
        
        let cellIdentifier = "ErrorTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ErrorTableViewCell else {
            return ErrorTableViewCell()
        }
        cell.errorMessage = errorMessage
        return cell
    }
}
