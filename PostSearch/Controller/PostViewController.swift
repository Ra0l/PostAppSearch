//
//  ViewController.swift
//  PostSearch
//
//  Created by Raul Kevin Aliaga Shapiama on 14/03/22.
//

import UIKit

class PostViewController: UIViewController {
    
    
    @IBOutlet weak private var tlbPosts: UITableView!
    
    
    lazy private var adapter : PostAdapter = {
        PostAdapter(controller: self)
    }()
    
    lazy private var presenter : PostPresenter = {
        PostPresenter(controller: self)
    }()
    
    private var arrayPosts = [PostResponse.DataResponse]()
    
}

//MARK: -- LifeCycle
extension PostViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter.listAll()
    }
    
}

//MARK: -- Get Properties
extension PostViewController {
    
    var getTlbPosts: UITableView { self.tlbPosts }
    var getArrayPosts: [PostResponse.DataResponse] { self.arrayPosts }
}

//MARK: -- Methods
extension PostViewController {
    
    func initAdapter() {
        self.adapter.initAdapter()
    }
    
    func reloadData(_ arrayPosts: [PostResponse.DataResponse]){
        self.arrayPosts = arrayPosts
        self.tlbPosts.reloadData()
    }
}
