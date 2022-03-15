//
//  PostDetailViewController.swift
//  PostSearch
//
//  Created by Raul Kevin Aliaga Shapiama on 14/03/22.
//

import Foundation
import UIKit

class PostDetailViewController: UIViewController {
    
    @IBOutlet weak var lblUserId : UILabel!
    @IBOutlet weak var lblTitle  : UILabel!
    @IBOutlet weak var lblBody   : UILabel!
    
    private lazy var presenter: PostDetailPresenter = { PostDetailPresenter(controller: self) }()
    
    var idDPost: Int!
    
}

//MARK: -- LifeCycle
extension PostDetailViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.didLoad()
    }
    
}

//MARK: -- Methods
extension PostDetailViewController {
    
    @IBAction func clickBtnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setInformation(_ objPost: PostResponse.DataResponse) {
        self.lblTitle.text = objPost.title
//        self.lblBody.text = objPost.body
    }
}
