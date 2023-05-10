//
//  ChatViewController.swift
//  ChatApp
//
//  Created by SeoYeon Hong on 2023/05/08.
//

import UIKit

final class ChatViewController: BaseModalViewController {

    private lazy var textInputView = UIView(color: .systemBackground)
    
    private lazy var placeHolderLabel = UILabel(text: "메시지 입력", font: Constants.Font.size16, textColor: Constants.Color.gray300 ?? .gray)
    
    private lazy var messageTextView: UITextView = {
        let textView = UITextView()
        textView.textColor = .label
        textView.font = Constants.Font.size16
        textView.textContainerInset = UIEdgeInsets(top: 14, left: 0, bottom: 12, right: 0)
        textView.becomeFirstResponder()
        textView.delegate = self
        return textView
    }()
    
    private lazy var sendButton: UIButton = {
        let button = UIButton()
        button.setImage(Constants.Image.planeFill?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = Constants.Color.gray300
        button.addTarget(self, action: #selector(onClickSendButton), for: .touchUpInside)
        return button
    }()
    
    lazy var line = UIView()
    
    var chatBottomConstraint: NSLayoutConstraint?
    var bottomConstraint: NSLayoutConstraint?
    
    lazy var chatTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(ChatTableViewCell.self, forCellReuseIdentifier: "chatCell")
        tableView.register(ChatHeaderView.self, forHeaderFooterViewReuseIdentifier: "header")
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.contentInset = UIEdgeInsets(top: -20, left: 0, bottom: 0, right: 0)
        return tableView
    }()
    
    lazy var safeArea = view.safeAreaLayoutGuide
    
    var messages = ["안녕하세요."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupInputView()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //MARK: - UI setup
    
    private func setupInputView() {
        view.addSubview(textInputView)
        textInputView.addSubview(sendButton)
        textInputView.addSubview(messageTextView)
        textInputView.addSubview(placeHolderLabel)
        textInputView.addSubview(line)
        line.backgroundColor = Constants.Color.gray200
        
        textInputView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalTo(safeArea)
            $0.height.greaterThanOrEqualTo(48)
        }
        
        sendButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(12)
            $0.height.width.equalTo(24)
        }
        
        placeHolderLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(24)
            $0.centerY.equalToSuperview()
        }

        messageTextView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalTo(sendButton.snp.leading)
            $0.top.bottom.equalToSuperview()
        }
        
        line.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        bottomConstraint = NSLayoutConstraint(item: textInputView, attribute: .bottom, relatedBy: .equal, toItem: safeArea, attribute: .bottom, multiplier: 1.0, constant: 0)
        bottomConstraint?.isActive = true
        
    }
    
    private func setupTableView() {
        view.addSubview(chatTableView)
        
        chatTableView.snp.makeConstraints {
            $0.top.equalTo(titleStackView.snp.bottom)
            $0.leading.trailing.equalTo(safeArea)
        }
        
        chatBottomConstraint = NSLayoutConstraint(item: chatTableView, attribute: .bottom, relatedBy: .equal, toItem: safeArea, attribute: .bottom, multiplier: 1.0, constant: -52)
        chatBottomConstraint?.isActive = true
    }
    
    @objc func onClickSendButton() {
        if let text = messageTextView.text, text != "" {
            messages.append(text)
            chatTableView.reloadData()
            chatTableView.scrollToRow(at: IndexPath(row: messages.count-1, section: 0), at: .bottom, animated: true)
            messageTextView.text = ""
            sendButton.tintColor = Constants.Color.gray300
            placeHolderLabel.isHidden = false
        }
    }
}

//MARK: - UITextView
extension ChatViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        if textView.text == "" {
            sendButton.tintColor = Constants.Color.gray300
            placeHolderLabel.isHidden = false
        } else {
            sendButton.tintColor = Constants.Color.main
            placeHolderLabel.isHidden = true
        }
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let keyboardHeight: CGFloat
            keyboardHeight = keyboardSize.height - view.safeAreaInsets.bottom
            bottomConstraint?.constant = -1 * keyboardHeight
            chatBottomConstraint?.constant = -1 * keyboardHeight - 52
            view.layoutIfNeeded()
            chatTableView.layoutIfNeeded()
            chatTableView.scrollToRow(at: IndexPath(row: messages.count-1, section: 0), at: .bottom, animated: true)
        }
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        bottomConstraint?.constant = 0
        chatBottomConstraint?.constant = -52
        view.layoutIfNeeded()
        chatTableView.layoutIfNeeded()
    }
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "chatCell", for: indexPath) as? ChatTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.chatLabel.text = messages[indexPath.row]
        return cell
    }
}

extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? ChatHeaderView else { return UIView() }
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 36
    }
}
