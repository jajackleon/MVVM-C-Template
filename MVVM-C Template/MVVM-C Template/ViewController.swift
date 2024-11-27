//
//  ViewController.swift
//  MVVM-C Template
//
//  Created by Jackie Leonardy on 27/11/24.
//

import SnapKit
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
        thisView.configureView(text: pageTitle)
        thisView.backgroundColor = backgroundColor
    }
    
    override func loadView() {
        view = thisView
    }
    
    private let pageTitle: String
    private let backgroundColor: UIColor
    private let thisView: View = View()
}

final class View: UIView {
    func configureView(text: String) {
        titleLabel.text = text
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has noot been implemented")
    }
    
    private lazy var titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.textColor = .black
        return label
    }()
}

private extension View {
    func setUpView() {
        addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
