//
//  StorageTest.swift
//  MyFavoriteMakesTests
//
//  Created by Sergey Libin on 14.07.2022.
//

import XCTest
@testable import MyFavoriteMakes

class StorageTest: XCTestCase {
    
    var sut: Storage!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = .init()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testGetFavoritesShouldReturnCorrectValue() {
        sut.favorites = TestData.favorites
        
        XCTAssertEqual(sut.getFavorites(), TestData.favorites)
    }
    
    func testAddToFavoritesShuldStoreCorrectValue() {
        sut.addToFavorites(TestData.bmw)
        
        XCTAssertEqual(sut.favorites, TestData.bmwSet)
    }
    
    func testRemoveFromFavoritesShouldRemoveOnlySpecifiedValue() {
        sut.favorites = TestData.favorites
        
        sut.removeFromFavorites(TestData.bmw)
        
        XCTAssertEqual(sut.favorites, TestData.mercedesAndTesla)
    }

}

private extension StorageTest {
    enum TestData {
        static var favorites: Set<String> = ["BMW", "Mercedes", "Tesla"]
        
        static var bmw = "BMW"
        
        static var bmwSet: Set<String> = [bmw]
        
        static var mercedesAndTesla: Set<String> = ["Mercedes", "Tesla"]
    }
}
