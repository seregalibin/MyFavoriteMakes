//
//  HomePresenter.swift
//  MyFavoriteMakes
//
//  Created by Sergey Libin on 13.07.2022.
//

import Foundation

protocol HomePresenterProtocol: AnyObject {
    func viewAppeared()
    func openListTapped()
}

final class HomePresenter {
    private weak var view: HomeViewControllerProtocol!
    private var coordinator: MainFlowCoordinatorProtocol
    private var storage: StorageProtocol

    // MARK: Init
    init(view: HomeViewControllerProtocol,
         coordinator: MainFlowCoordinatorProtocol,
         storage: StorageProtocol)
    {
        self.view = view
        self.coordinator = coordinator
        self.storage = storage
    }
}

// MARK: - HomePresenterProtocol
extension HomePresenter: HomePresenterProtocol {
    func viewAppeared() {
        view.updateFavCount(storage.getFavorites().count)
    }
    
    func openListTapped() {
        coordinator.showFavList()
    }
}
