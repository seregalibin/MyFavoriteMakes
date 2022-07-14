//
//  FavListPresenterTest.swift
//  MyFavoriteMakesTests
//
//  Created by Sergey Libin on 14.07.2022.
//

import XCTest
@testable import MyFavoriteMakes

class FavListPresenterTest: XCTestCase {
    
    var sut: FavListPresenter!
    var view: FavListViewControllerMock!
    var coordinator: MainFlowCoordinatorMock!
    var storage: StorageMock!
    var networking: NetworkingMock!

    override func setUpWithError() throws {
        try super.setUpWithError()
        view = .init()
        coordinator = .init()
        storage = .init()
        networking = .init()
        
        sut = .init(view: view,
                    coordinator: coordinator,
                    storage: storage,
                    networking: networking)
    }

    override func tearDownWithError() throws {
        sut = nil
        view = nil
        coordinator = nil
        storage = nil
        networking = nil
        
        try super.tearDownWithError()
    }
    
    func testViewLoadedShouldCallGetMakesNetworkRequestOnce() {
        sut.viewLoaded()
        
        XCTAssertEqual(networking.getMakesCallsCount, 1)
    }
    
    func testViewLoadedShouldUpdateViewOnce() {
        sut.viewLoaded()
        networking.getMakesCompletion.first?(TestData.dataToGetOnGetMakes)
        
        XCTAssertEqual(view.updatTableViewDataCallsCount, 1)
    }
    
    func testViewLoadedShouldUpdateViewWithCorrectArgs() {
        sut.viewLoaded()
        networking.getMakesCompletion.first?(TestData.dataToGetOnGetMakes)
        
        XCTAssertEqual(view.updatTableViewDataArgs, TestData.dataToUpdateView)
    }
    
    func testViewLoadedShouldUpdateViewWithAllFavorites() {
        storage.favorites = TestData.allFavorites
        
        sut.viewLoaded()
        networking.getMakesCompletion.first?(TestData.dataToGetOnGetMakes)
        
        XCTAssertEqual(view.updatTableViewDataArgs, TestData.dataToUpdateViewAllFavorites)
    }
    
    func testFavoriteChangedShouldAskToAddValueToStorageOnce() {
        sut.favoriteChanged(for: TestData.favoriteToUpdate, to: true)
        
        XCTAssertEqual(storage.addToFavoritesCallsCount, 1)
    }
    
    func testFavoriteChangedShouldAskToRemoveValueToStorageOnce() {
        sut.favoriteChanged(for: TestData.favoriteToUpdate, to: false)
        
        XCTAssertEqual(storage.removeFromFavoritesCallsCount, 1)
    }

}

private extension FavListPresenterTest {
    enum TestData {
        static var dataToGetOnGetMakes = ["BMW", "Mercedes", "Tesla"]
        
        static var dataToUpdateView: [MakeModel] = [
            .init(name: "BMW", isFavorite: false),
            .init(name: "Mercedes", isFavorite: false),
            .init(name: "Tesla", isFavorite: false)
        ]
        
        static var allFavorites: Set<String> = ["BMW", "Mercedes", "Tesla"]
        
        static var dataToUpdateViewAllFavorites: [MakeModel] = [
            .init(name: "BMW", isFavorite: true),
            .init(name: "Mercedes", isFavorite: true),
            .init(name: "Tesla", isFavorite: true)
        ]
        
        static var favoriteToUpdate = "BMW"
    }
}
