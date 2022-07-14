//
//  NetworkingMock.swift
//  MyFavoriteMakesTests
//
//  Created by Sergey Libin on 14.07.2022.
//

import Foundation
@testable import MyFavoriteMakes

class NetworkingMock: NetworkingProtocol {
    
    var getMakesCallsCount = 0
    var getMakesCompletion: [([String]) -> Void] = []
    
    func getMakes(completion: @escaping ([String]) -> Void) {
        getMakesCallsCount += 1
        getMakesCompletion.append(completion)
    }
}

