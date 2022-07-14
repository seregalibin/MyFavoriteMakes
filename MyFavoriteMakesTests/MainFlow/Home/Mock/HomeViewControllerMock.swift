//
//  HomeViewControllerMock.swift
//  MyFavoriteMakesTests
//
//  Created by Sergey Libin on 13.07.2022.
//

import Foundation
@testable import MyFavoriteMakes

class HomeViewControllerMock: HomeViewControllerProtocol {
    var updateFavCountCallsCount = 0
    
    func updateFavCount(_ count: Int) {
        updateFavCountCallsCount += 1
    }
}
