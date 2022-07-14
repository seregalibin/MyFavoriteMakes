//
//  FavListViewController.swift
//  MyFavoriteMakes
//
//  Created by Sergey Libin on 13.07.2022.
//

import UIKit

protocol FavListViewControllerProtocol: AnyObject {
    func updatTableViewData(_ data: [MakeModel])
}

final class FavListViewController: UITableViewController {
    
    var presenter: FavListPresenterProtocol?
    
    private var tableViewData: [MakeModel] = []
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewLoaded()
        
        configureViews()
    }
    
    // MARK: TableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MakeCell.reuseIdentifier) as? MakeCell
        let data = tableViewData[indexPath.row]
        
        cell?.setup(model: data, favoriteChanged: { [weak self] isFavorite in
            self?.presenter?.favoriteChanged(for: data.name, to: isFavorite)
        })
        
        return cell ?? UITableViewCell()
    }

}

// MARK: Private methods
private extension FavListViewController {
    
    func configureViews() {
        view.backgroundColor = .white
        
        self.navigationItem.title = "Select favorites"
        
        tableView.register(MakeCell.self, forCellReuseIdentifier: MakeCell.reuseIdentifier)
    }
}

// MARK: - FavListViewControllerProtocol
extension FavListViewController: FavListViewControllerProtocol {
    func updatTableViewData(_ data: [MakeModel]) {
        tableViewData = data
        tableView.reloadData()
    }
}
