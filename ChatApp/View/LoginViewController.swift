//
//  LoginViewController.swift
//  ChatApp
//
//  Created by SeoYeon Hong on 2023/05/10.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .label
        textField.placeholder = "이름을 입력해주세요."
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        textField.returnKeyType = .done
        textField.becomeFirstResponder()
        textField.delegate = self
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인", for: .normal)
        button.setTitleColor(Constants.Color.main, for: .normal)
        button.setTitleColor(Constants.Color.gray300, for: .disabled)
        button.addTarget(self, action: #selector(onClickLoginButton), for: .touchUpInside)
        button.isEnabled = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    private func setupView() {
        view.addSubview(nameTextField)
        view.addSubview(loginButton)
        
        loginButton.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        nameTextField.snp.makeConstraints {
            $0.bottom.equalTo(loginButton.snp.top).offset(-60)
            $0.centerX.equalToSuperview()
        }
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @objc private func onClickLoginButton() {
        guard let name = nameTextField.text else { return }
        UserDefaultManager.userName = name
        Auth.auth().signInAnonymously()
        navigationController?.pushViewController(TabBarController(), animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let oldString = textField.text, let newRange = Range(range, in: oldString) else { return true }

        let inputString = string.trimmingCharacters(in: .whitespacesAndNewlines)
        let newString = oldString.replacingCharacters(in: newRange, with: inputString)
            .trimmingCharacters(in: .whitespacesAndNewlines)
        
        loginButton.isEnabled = !newString.isEmpty

        return true
    }
}
