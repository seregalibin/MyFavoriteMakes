//
//  HomePresenterTest.swift
//  MyFavoriteMakesTests
//
//  Created by Sergey Libin on 13.07.2022.
//

import XCTest
@testable import MyFavoriteMakes

class HomePresenterTest: XCTestCase {
    
    var sut: HomePresenter!
    var view: HomeViewControllerMock!
    var coordinator: MainFlowCoordinatorMock!
    var storage: StorageMock!

    override func setUpWithError() throws {
        try super.setUpWithError()
        view = .init()
        coordinator = .init()
        storage = .init()
        
        sut = HomePresenter(view: view,
                            coordinator: coordinator,
                            storage: storage)
    }

    override func tearDownWithError() throws {
        sut = nil
        view = nil
        coordinator = nil
        storage = nil
        
        try super.tearDownWithError()
    }
    
    func testViewAppearedShouldUpdateViewOnce() {
        sut.viewAppeared()
        XCTAssertEqual(view.updateFavCountCallsCount, 1)
    }
    
    func testViewAppearedShouldCallStorageOnce() {
        sut.viewAppeared()
        XCTAssertEqual(storage.getFavoritesCallsCount, 1)
    }
    
    func testOpenListTappedShouldCallCoordinatorOnce() {
        sut.openListTapped()
        XCTAssertEqual(coordinator.showFavListCallCount, 1)
    }


}
