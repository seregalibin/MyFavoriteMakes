//
//  Storage.swift
//  MyFavoriteMakes
//
//  Created by Sergey Libin on 13.07.2022.
//

import Foundation

protocol StorageProtocol {
    func getFavorites() -> Set<String>
    func addToFavorites(_ value: String)
    func removeFromFavorites(_ value: String)
}

class Storage: StorageProtocol {
    var favorites: Set<String> = []
    
    func getFavorites() -> Set<String> {
        return favorites
    }
    
    func addToFavorites(_ value: String) {
        self.favorites.insert(value)
    }
    
    func removeFromFavorites(_ value: String) {
        self.favorites.remove(value)
    }
}
