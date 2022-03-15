//
//  ViewController.swift
//  PostSearch
//
//  Created by Raul Kevin Aliaga Shapiama on 14/03/22.
//

import UIKit

class PostViewController: UIViewController, ListPostsViewController {
    
    @IBOutlet weak private var tlbPosts: UITableView!
    lazy private var adapter : PostAdapter = { PostAdapter(controller: self) }()
    lazy private var presenter : PostPresenter = { PostPresenter(controller: self) }()
    
    lazy var refreshControl: UIRefreshControl = {
       let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .blue
        refreshControl.addTarget(self, action: #selector(self.pullToRefresh), for: .valueChanged)
        self.tlbPosts.addSubview(refreshControl)
        return refreshControl
    }()
    
}

//MARK: -- LifeCycle
extension PostViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter.didLoad()
    }
    
}

//MARK: -- Methods
extension PostViewController {
    
    @objc private func pullToRefresh() {
        self.presenter.listAll()
    }
    
    func showLoading(_ isLoading: Bool){
        isLoading ? self.refreshControl.beginRefreshing() : self.refreshControl.endRefreshing()
    }
    
    func initAdapter() {
        self.adapter.initAdapterWithTableView(self.tlbPosts)
    }
    
    func reloadData(_ arrayData: [Any]){
        self.adapter.arrayData = arrayData
        self.tlbPosts.reloadData()
    }
    
    func didSelectPost(_ objPost: PostResponse.DataResponse) {
        
    }
}
