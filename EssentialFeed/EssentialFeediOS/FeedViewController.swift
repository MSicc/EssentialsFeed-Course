//
//  FeedViewController.swift
//  EssentialFeediOS
//
//  Created by Marco Siccardi on 26.05.2025.
//

import UIKit
import EssentialFeed


public final class FeedViewController: UITableViewController {
    private var loader: FeedLoader?
    
    private var tableModel = [FeedImage]()
    
    private var viewAppeared: Bool = false
    
    public convenience init(loader: FeedLoader?) {
        self.init()
        self.loader = loader
    }
    
    public override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        
        if !viewAppeared {
            refreshControl?.beginRefreshing()
            viewAppeared = true
        }
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(load), for: .valueChanged)
        load()
    }
    
    @objc private func load() {
        if viewAppeared {
            refreshControl?.beginRefreshing()
        }
        loader?.load { [weak self] result in
            self?.tableModel = (try? result.get()) ?? []
            self?.tableView.reloadData()
            self?.refreshControl?.endRefreshing()
        }
    }

    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableModel.count
    }

    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModel = tableModel[indexPath.row]
        let cell = FeedImageCell()
        cell.locationContainer.isHidden = (cellModel.location == nil)
        cell.locationLabel.text = cellModel.location
        cell.descriptionLabel.text = cellModel.description
        return cell
    }
}
