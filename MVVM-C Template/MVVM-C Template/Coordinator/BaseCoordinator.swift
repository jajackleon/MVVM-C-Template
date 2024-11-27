//
//  BaseCoordinator.swift
//  MVVM-C Template
//
//  Created by Jackie Leonardy on 27/11/24.
//

import Foundation
import UIKit

// Base or Parent coordinator
class BaseCoordinator {
    weak var parentCoordinator: Coordinator?
    weak var navigationController: UINavigationController?
    
    private let startingIndex: Int
    
    init(navigationController : UINavigationController) {
        self.navigationController = navigationController
        startingIndex = max(0, navigationController.viewControllers.count - 1)
    }
}

extension BaseCoordinator: BaseCoordinatorProtocol {
    func start() {
        // Child Implementation
        parentCoordinator?.children.append(self)
    }
    
    func start(viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    /// Removing a coordinator inside a children. This call is important to prevent memory leak.
    /// - Parameter coordinator: Coordinator that finished.
    func childDidFinish(_ coordinator : BaseCoordinatorProtocol){
        if let parentCoordinator {
            parentCoordinator.childDidFinish(self)
        }
        
        if let navigationController,
                startingIndex < navigationController.viewControllers.count {
            let targetStartViewController: UIViewController = navigationController.viewControllers[max(0, startingIndex)]
            navigationController.popToViewController(targetStartViewController, animated: true)
        }
    }
}
