//
//  BaseModalViewController.swift
//  ChatApp
//
//  Created by SeoYeon Hong on 2023/05/08.
//

import UIKit

class BaseModalViewController: UIViewController {

    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setImage(Constants.Image.close?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = Constants.Color.gray400
        button.addTarget(self, action: #selector(onClickCloseButton), for: .touchUpInside)
        return button
    }()
    
    lazy var titleLabel = UILabel(text: "홍서연", font: Constants.Font.title)
    
    lazy var subLabel = UILabel(text: "iOS Developer",
                           font: Constants.Font.size12,
                           textColor: Constants.Color.gray400 ?? .gray)
    
    lazy var titleStackView = UIStackView(axis: .vertical,
                                          spacing: 0,
                                          align: .center,
                                          subViews: [titleLabel, subLabel],
                                          layoutMargin: UIEdgeInsets(top: 8, left: 44, bottom: 8, right: 44))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        view.addSubview(titleStackView)
        view.addSubview(closeButton)
        
        let safeArea = view.safeAreaLayoutGuide
        
        titleStackView.snp.makeConstraints {
            $0.height.equalTo(58)
            $0.top.leading.trailing.equalTo(safeArea)
        }
        
        closeButton.snp.makeConstraints {
            $0.leading.equalTo(safeArea).offset(20)
            $0.height.width.equalTo(24)
            $0.centerY.equalTo(titleStackView)
        }
    }
    
    @objc private func onClickCloseButton() {
        self.dismiss(animated: true)
    }
}

extension BaseModalViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
}
