//
//  ChatViewController.swift
//  ChatApp
//
//  Created by SeoYeon Hong on 2023/05/08.
//

import UIKit

final class ChatViewController: BaseModalViewController {

    private lazy var textInputView = UIView()
    
    private lazy var messageField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "메시지 입력"
        textField.font = Constants.Font.size16
        textField.becomeFirstResponder()
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        return textField
    }()
    
    private lazy var sendButton: UIButton = {
        let button = UIButton()
        button.setImage(Constants.Image.planeFill?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = Constants.Color.gray300
        return button
    }()
    
    lazy var line = UIView()
    
    var bottomConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupInputView()
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //MARK: - UI setup
    
    private func setupInputView() {
        view.addSubview(textInputView)
        textInputView.addSubview(messageField)
        textInputView.addSubview(sendButton)
        textInputView.addSubview(line)
        line.backgroundColor = Constants.Color.gray200
        
        let safeArea = view.safeAreaLayoutGuide
        
        textInputView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalTo(safeArea)
            $0.height.greaterThanOrEqualTo(48)
        }
        
        sendButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(12)
            $0.height.width.equalTo(24)
        }
        
        messageField.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalTo(sendButton.snp.leading)
            $0.centerY.equalToSuperview()
        }
        
        line.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        bottomConstraint = NSLayoutConstraint(item: textInputView, attribute: .bottom, relatedBy: .equal, toItem: safeArea, attribute: .bottom, multiplier: 1.0, constant: 0)
        bottomConstraint?.isActive = true
    }
}

//MARK: - UITextField

extension ChatViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if textField.text == "" {
            sendButton.tintColor = Constants.Color.gray300
        } else {
            sendButton.tintColor = Constants.Color.main
        }
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let keyboardHeight: CGFloat
            keyboardHeight = keyboardSize.height - self.view.safeAreaInsets.bottom
            self.bottomConstraint?.constant = -1 * keyboardHeight
            self.view.layoutIfNeeded()
        }
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        self.bottomConstraint?.constant = 0
        self.view.layoutIfNeeded()
    }
}
