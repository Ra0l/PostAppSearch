//
//  ViewController.swift
//  PostSearch
//
//  Created by Raul Kevin Aliaga Shapiama on 14/03/22.
//

import UIKit

class PostViewController: UIViewController, ListPostsViewController, PostFilterViewController {
    
    @IBOutlet weak private var tlbPosts: UITableView!
    @IBOutlet weak private var searchPost : UISearchBar!
    lazy private var listPostAdapter   : PostAdapter       = { PostAdapter(controller: self) }()
    lazy private var filterPostAdapter : PostFilterAdapter = { PostFilterAdapter(controller: self) }()
    lazy private var presenter         : PostPresenter     = { PostPresenter(controller: self) }()
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.presenter.prepare(for: segue, sender: sender)
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
    
    func initAdapters() {
        self.listPostAdapter.initAdapterWithTableView(self.tlbPosts)
        self.filterPostAdapter.initAdapterWithSearchBar(self.searchPost)
    }
    
    func reloadData(_ arrayData: [Any]){
        self.filterPostAdapter.arrayPosts = arrayData as? [PostResponse.DataResponse] ?? []
        self.listPostAdapter.arrayData = arrayData
        self.tlbPosts.reloadData()
    }
    
    func didSelectPost(_ objPost: PostResponse.DataResponse) {
        self.performSegue(withIdentifier: "PostDetailViewController", sender: objPost)
    }
    
    func didPostFilterWithArray(_ arrayFilter: [Any]) {
        self.listPostAdapter.arrayData = arrayFilter
        self.tlbPosts.reloadData()
    }
}
