//
//  MessageViewController.swift
//  ChatApp
//
//  Created by SeoYeon Hong on 2023/05/07.
//

import UIKit

final class MessageViewController: UIViewController {

    private lazy var newMessageButton: UIButton = {
        let button = UIButton()
        button.setTitle("새 메시지", for: .normal)
        button.setTitleColor(Constants.Color.main, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.frame = CGRect(x: 0, y: 0, width: 60, height: 44)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }

    private func setupView() {
        title = Constants.Text.message
        let rightNaviButton = UIBarButtonItem(customView: newMessageButton)
        navigationItem.rightBarButtonItem = rightNaviButton
    }
}
