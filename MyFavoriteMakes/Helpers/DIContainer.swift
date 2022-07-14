//
//  DIContainer.swift
//  MyFavoriteMakes
//
//  Created by Sergey Libin on 13.07.2022.
//

import Foundation

protocol DIContainerProtocol {
    var storage: StorageProtocol { get }
    var networking: NetworkingProtocol { get }
}

final class DIContainer: DIContainerProtocol {
    lazy var storage: StorageProtocol = Storage()
    lazy var networking: NetworkingProtocol = Networking()
}
