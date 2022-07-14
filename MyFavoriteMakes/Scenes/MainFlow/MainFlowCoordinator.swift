//
//  MainFlowCoordinator.swift
//  MyFavoriteMakes
//
//  Created by Sergey Libin on 13.07.2022.
//

import UIKit

protocol MainFlowCoordinatorProtocol {
    func showFavList()
}

final class MainFlowCoordinator: Coordinator, MainFlowCoordinatorProtocol {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var container: DIContainerProtocol
    
    init(navigationController: UINavigationController, container: DIContainerProtocol) {
        self.navigationController = navigationController
        self.container = container
    }
    
    func start() {
        let vc = HomeViewController()
        let presenter =  HomePresenter(view: vc, coordinator: self, storage: container.storage)
        vc.presenter = presenter
        navigationController.pushViewController(vc, animated: false)
    }
    
    func showFavList() {
        let vc = FavListViewController()
        let presenter =  FavListPresenter(view: vc, coordinator: self, storage: container.storage, networking: container.networking)
        vc.presenter = presenter
        navigationController.pushViewController(vc, animated: true)
    }
}
