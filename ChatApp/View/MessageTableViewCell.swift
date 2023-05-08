//
//  MessageTableViewCell.swift
//  ChatApp
//
//  Created by SeoYeon Hong on 2023/05/07.
//

import UIKit
import SnapKit

final class MessageTableViewCell: UITableViewCell {
    
    private lazy var profileImageView = UIImageView(cornerRadius: 4,
                                                    image: Constants.Image.defaultProfile ?? nil)

    private let nameLabel = UILabel(text: "홍서연", font: Constants.Font.title)
    
    private let descriptionLabel = UILabel(text: "iOS Developer",
                                           font: Constants.Font.size14,
                                           textColor: Constants.Color.gray400 ?? .gray)
    
    private let messageLabel = UILabel(text: "안녕하세요. hongssup님 반갑습니다.", font: Constants.Font.size16)
    
    private let dateLabel = UILabel(text: "3일전",
                                    font: Constants.Font.size14,
                                    textColor: Constants.Color.gray400 ?? .gray)
    
    private lazy var imageStackView = UIStackView(axis: .vertical,
                                                  spacing: 0,
                                                  subViews: [profileImageView, UIView()])
    
    private lazy var messageStackView = UIStackView(axis: .vertical,
                                                    spacing: 4,
                                                    subViews: [nameLabel, descriptionLabel, UIView(), messageLabel],
                                                    layoutMargin: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0))
    
    private lazy var dateStackView = UIStackView(axis: .vertical,
                                                 spacing: 0,
                                                 align: .trailing,
                                                 subViews: [dateLabel, UIView()])
    
    private lazy var stackView = UIStackView(axis: .horizontal,
                                             spacing: 0,
                                             subViews: [imageStackView, messageStackView, dateStackView],
                                             layoutMargin: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
    
    private let bottomLine = UIView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupCell() {
        self.contentView.addSubview(stackView)
        self.contentView.addSubview(bottomLine)
        bottomLine.backgroundColor = Constants.Color.gray200
        
        profileImageView.snp.makeConstraints {
            $0.height.width.equalTo(44)
        }
        
        dateStackView.snp.makeConstraints {
            $0.width.equalTo(80)
        }
        
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        bottomLine.snp.makeConstraints {
            $0.leading.equalTo(messageStackView.snp.leading).offset(20)
            $0.trailing.bottom.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
}
