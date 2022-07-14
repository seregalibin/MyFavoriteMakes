//
//  HomeViewController.swift
//  MyFavoriteMakes
//
//  Created by Sergey Libin on 13.07.2022.
//

import UIKit

protocol HomeViewControllerProtocol: AnyObject {
    func updateFavCount(_ count: Int)
}

final class HomeViewController: UIViewController {
    
    var presenter: HomePresenterProtocol?
    
    // MARK: UI Components
    lazy var favCountLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "0"
        lbl.font = .boldSystemFont(ofSize: 50)
        lbl.numberOfLines = 1
        lbl.textColor = .red
        lbl.textAlignment = .center
        return lbl
    }()
    
    lazy var openListButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Select your favorite makes", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 20)
        btn.titleLabel?.textAlignment = .center
        btn.backgroundColor = .lightGray
        btn.setTitleColor(.white, for: .normal)
        btn.addTarget(self, action: #selector(openListButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewAppeared()
    }
}

// MARK: Private methods
private extension HomeViewController {
    
    func configureViews() {
        self.view.backgroundColor = .white
        self.navigationItem.title = "My favorite makes"
        [favCountLabel, openListButton].forEach(view.addSubview)
    }
    
    func setupConstraints() {
        favCountLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            favCountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            favCountLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            favCountLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            favCountLabel.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        openListButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            openListButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            openListButton.topAnchor.constraint(equalTo: favCountLabel.bottomAnchor, constant: 70),
            openListButton.heightAnchor.constraint(equalToConstant: 50),
            openListButton.widthAnchor.constraint(equalToConstant: 250),
        ])
        
        openListButton.layer.cornerRadius = 15
    }
    
    @objc
    func openListButtonTapped() {
        presenter?.openListTapped()
    }
}

// MARK: - HomeViewControllerProtocol
extension HomeViewController: HomeViewControllerProtocol {
    func updateFavCount(_ count: Int) {
        favCountLabel.text = (String(count))
    }
}

