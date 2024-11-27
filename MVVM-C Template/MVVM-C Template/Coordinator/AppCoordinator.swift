//
//  AppCoordinator.swift
//  MVVM-C Template
//
//  Created by Jackie Leonardy on 27/11/24.
//

import Foundation
import UIKit

final class AppCoordinator {
    // Properties
    weak var parentCoordinator: Coordinator?
    var children: [BaseCoordinatorProtocol] = []
    weak var navigationController: UINavigationController?
    
    // Static shared instance
    static let shared: AppCoordinator = AppCoordinator()
    
    // Private initializer to prevent instantiation from outside
    private init() {}
}

extension AppCoordinator: Coordinator {
    func start() {
        guard let navigationController: UINavigationController else {
            assertionFailure("Navigation controller must be set before starting the coordinator.")
            return
        }
        let exampleCoordinator: ExampleCoordinator = .init(navigationController: navigationController)
        exampleCoordinator.parentCoordinator = self
        
        exampleCoordinator.start()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: { [weak self] in
            guard let self,
                  let navigationController: UINavigationController = self.navigationController else { return }
            let exampleCoordinator: ExampleCoordinator2 = ExampleCoordinator2(navigationController: navigationController)
            exampleCoordinator.parentCoordinator = self
            exampleCoordinator.start()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
                exampleCoordinator.finish()
            })
        })
    }
    
    func setNavigationController(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func childDidFinish(_ coordinator : BaseCoordinatorProtocol){
        // Call this if a coordinator is done.
        for (index, child) in children.enumerated() {
            if child === coordinator {
                children.remove(at: index)
                break
            }
        }
    }
}
