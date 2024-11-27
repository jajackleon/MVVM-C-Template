//
//  Coordinator.swift
//  MVVM-C Template
//
//  Created by Jackie Leonardy on 27/11/24.
//

import Foundation
import UIKit

@objc protocol Coordinator: BaseCoordinatorProtocol {
    var children: [BaseCoordinatorProtocol] { get set }
    
    func childDidFinish(_ coordinator : BaseCoordinatorProtocol)
}

@objc protocol BaseCoordinatorProtocol {
    var parentCoordinator: Coordinator? { get set }
    var navigationController : UINavigationController? { get set }
    
    func start()
}
