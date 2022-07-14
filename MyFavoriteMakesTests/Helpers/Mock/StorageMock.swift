//
//  StorageMock.swift
//  MyFavoriteMakesTests
//
//  Created by Sergey Libin on 13.07.2022.
//

import Foundation
@testable import MyFavoriteMakes

class StorageMock: StorageProtocol {
    var getFavoritesCallsCount = 0
    var addToFavoritesCallsCount = 0
    var removeFromFavoritesCallsCount = 0
    
    var favorites: Set<String> = []
    
    func getFavorites() -> Set<String> {
        getFavoritesCallsCount += 1
        return favorites
    }
    
    func addToFavorites(_ value: String) {
        addToFavoritesCallsCount += 1
        favorites.insert(value)
    }
    
    func removeFromFavorites(_ value: String) {
        removeFromFavoritesCallsCount += 1
        favorites.remove(value)
    }
    
}
