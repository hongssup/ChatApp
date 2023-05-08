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
        button.setTitle(Constants.Text.newMessage, for: .normal)
        button.setTitleColor(Constants.Color.main, for: .normal)
        button.titleLabel?.font = Constants.Font.size16
        button.frame = CGRect(x: 0, y: 0, width: 60, height: 44)
        button.addTarget(self, action: #selector(onClickNewMessageButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var messageTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(MessageTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupTableView()
    }

    private func setupView() {
        title = Constants.Text.message
        let rightNaviButton = UIBarButtonItem(customView: newMessageButton)
        navigationItem.rightBarButtonItem = rightNaviButton
    }
    
    private func setupTableView() {
        view.addSubview(messageTableView)
        let safeArea = view.safeAreaLayoutGuide
        
        messageTableView.snp.makeConstraints {
            $0.edges.equalTo(safeArea)
        }
    }
    
    @objc private func onClickNewMessageButton() {
    }
}

extension MessageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MessageTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        
        return cell
    }
}
