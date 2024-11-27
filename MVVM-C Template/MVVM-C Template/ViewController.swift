//
//  ViewController.swift
//  MVVM-C Template
//
//  Created by Jackie Leonardy on 27/11/24.
//

import UIKit

final class ViewController: UIViewController {
    init(title: String, backgroundColor: UIColor) {
        pageTitle = title
        self.backgroundColor = backgroundColor
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has noot been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("view Did Load")
        
        title = pageTitle
        view.backgroundColor = backgroundColor
    }
    
    private let pageTitle: String
    private let backgroundColor: UIColor
}

