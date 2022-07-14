//
//  FavListPresenter.swift
//  MyFavoriteMakes
//
//  Created by Sergey Libin on 13.07.2022.
//

import Foundation

protocol FavListPresenterProtocol: AnyObject {
    func viewLoaded()
    func favoriteChanged(for: String, to: Bool)
}

final class FavListPresenter {
    private weak var view: FavListViewControllerProtocol!
    private var coordinator: MainFlowCoordinatorProtocol
    private var storage: StorageProtocol
    private var networking: NetworkingProtocol
    
    // MARK: Init
    init(view: FavListViewControllerProtocol,
         coordinator: MainFlowCoordinatorProtocol,
         storage: StorageProtocol,
         networking: NetworkingProtocol)
    {
        self.view = view
        self.coordinator = coordinator
        self.storage = storage
        self.networking = networking
    }
}

// MARK: - FavListPresenterProtocol
extension FavListPresenter: FavListPresenterProtocol {
    func viewLoaded() {
        networking.getMakes { [weak self] makes in
            guard let self = self else { return }
            
            let makeArray: [MakeModel] = makes.map { .init(name: $0, isFavorite: self.storage.getFavorites().contains($0)) }
            self.view?.updatTableViewData(makeArray)
        }
    }
    
    func favoriteChanged(for value: String, to bool: Bool) {
        bool ? storage.addToFavorites(value) : storage.removeFromFavorites(value)
    }
}
