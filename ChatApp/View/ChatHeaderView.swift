//
//  ChatHeaderView.swift
//  ChatApp
//
//  Created by SeoYeon Hong on 2023/05/10.
//

import UIKit

final class ChatHeaderView: UITableViewHeaderFooterView {
    let line = UIView(color: Constants.Color.gray200 ?? .gray)
    let dateView = UIView(color: .systemBackground)
    let dateLabel = UILabel(text: "오늘", font: Constants.Font.size14, textColor: Constants.Color.gray400 ?? .gray)
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.backgroundColor = .systemBackground
        self.addSubview(line)
        self.addSubview(dateView)
        dateView.addSubview(dateLabel)
        
        line.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        dateView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        dateLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.bottom.equalToSuperview()
        }
    }
}
