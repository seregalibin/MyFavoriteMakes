//
//  MainFlowCoordinatorMock.swift
//  MyFavoriteMakesTests
//
//  Created by Sergey Libin on 13.07.2022.
//

import Foundation
@testable import MyFavoriteMakes

class MainFlowCoordinatorMock: MainFlowCoordinatorProtocol {
    var showFavListCallCount = 0
    
    func showFavList() {
        showFavListCallCount += 1
    }
    
    
}
