//
//  ExampleCoordinator.swift
//  MVVM-C Template
//
//  Created by Jackie Leonardy on 27/11/24.
//

import Foundation
import UIKit

final class ExampleCoordinator: BaseCoordinator {
    override func start() {
        super.start()
        start(viewController: ViewController(title: "Page 1", backgroundColor: .green))
    }
}

final class ExampleCoordinator2: BaseCoordinator {
    override func start() {
        super.start()
        start(viewController: ViewController(title: "Page 2", backgroundColor: .white))
    }
    
    func finish() {
        childDidFinish(self)
    }
}
