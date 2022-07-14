//
//  Networking.swift
//  MyFavoriteMakes
//
//  Created by Sergey Libin on 13.07.2022.
//

import Foundation

protocol NetworkingProtocol: AnyObject {
    func getMakes(completion: @escaping([String]) -> Void)
}

final class Networking: NetworkingProtocol {
    func getMakes(completion: @escaping([String]) -> Void) {
        let testData = [
            "BMW",
            "Mercedes",
            "Tesla",
            "RR",
            "Audi",
            "Opel",
            "Jeep",
            "Ford",
            "Porshe"
        ]
        completion(testData)
    }
}
