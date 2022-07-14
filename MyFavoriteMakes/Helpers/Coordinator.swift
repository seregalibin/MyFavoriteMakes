//
//  Coordinator.swift
//  MyFavoriteMakes
//
//  Created by Sergey Libin on 13.07.2022.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    var container: DIContainerProtocol { get }
    
    func start()
}
