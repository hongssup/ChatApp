//
//  ChatTableViewCell.swift
//  ChatApp
//
//  Created by SeoYeon Hong on 2023/05/08.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

    lazy var chatView = UIView(cornerRadius: 12, color: Constants.Color.main ?? .systemBlue)
    
    lazy var chatLabel = UILabel(text: "안녕하세요.", font: Constants.Font.size16, textColor: .white, lines: 0)
    
    lazy var timeLabel = UILabel(text: "오전 10:23", font: Constants.Font.size11, textColor: Constants.Color.gray400 ?? .gray)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupCell() {
        contentView.addSubview(chatView)
        chatView.addSubview(chatLabel)
        contentView.addSubview(timeLabel)
        
        
        chatView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20)
            $0.width.lessThanOrEqualTo(contentView.frame.width * 0.8)
            $0.top.bottom.equalToSuperview().inset(4)
        }
        
        chatLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(12)
            $0.top.bottom.equalToSuperview().inset(10)
        }
        
        timeLabel.snp.makeConstraints {
            $0.trailing.equalTo(chatView.snp.leading).offset(-10)
            $0.bottom.equalTo(chatView).offset(-12)
        }
    }
}
