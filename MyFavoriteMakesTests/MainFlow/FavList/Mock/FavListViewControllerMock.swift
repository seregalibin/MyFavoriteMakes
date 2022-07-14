//
//  FavListViewControllerMock.swift
//  MyFavoriteMakesTests
//
//  Created by Sergey Libin on 14.07.2022.
//

import Foundation
@testable import MyFavoriteMakes

class FavListViewControllerMock: FavListViewControllerProtocol {
    var updatTableViewDataCallsCount = 0
    var updatTableViewDataArgs: [MakeModel] = []
    
    func updatTableViewData(_ data: [MakeModel]) {
        updatTableViewDataCallsCount += 1
        updatTableViewDataArgs = data
    }
}
