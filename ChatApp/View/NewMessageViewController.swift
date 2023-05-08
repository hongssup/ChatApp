//
//  NewMessageViewController.swift
//  ChatApp
//
//  Created by SeoYeon Hong on 2023/05/08.
//

import UIKit

final class NewMessageViewController: BaseModalViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    private func setupView() {
        titleLabel.text = Constants.Text.newMessage
        subLabel.isHidden = true
        titleStackView.removeArrangedSubview(subLabel)
    }
}
