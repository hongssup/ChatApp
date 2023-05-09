//
//  Extensions.swift
//  ChatApp
//
//  Created by SeoYeon Hong on 2023/05/07.
//

import UIKit

extension UIView {
    convenience init(cornerRadius: CGFloat = 0, color: UIColor) {
        self.init(frame: .zero)
        self.layer.cornerRadius = cornerRadius
        self.backgroundColor = color
    }
}

extension UIImageView {
    convenience init(cornerRadius: CGFloat, image: UIImage? = nil, mode: ContentMode = .scaleAspectFit) {
        self.init()
        self.image = image
        self.layer.cornerRadius = cornerRadius
        self.contentMode = mode
        self.clipsToBounds = true
    }
}

extension UILabel {
    convenience init(text: String, font: UIFont, textColor: UIColor = .label, lines: Int = 1) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
        self.textColor = textColor
        self.numberOfLines = lines
    }
}

extension UIStackView {
    convenience init(axis: NSLayoutConstraint.Axis, spacing: CGFloat, align: UIStackView.Alignment = .leading, subViews: [UIView], layoutMargin: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)) {
        self.init(frame: .zero)
        self.axis = axis
        self.spacing = spacing
        self.alignment = align
        subViews.forEach {
            self.addArrangedSubview($0)
        }
        self.layoutMargins = layoutMargin
        self.isLayoutMarginsRelativeArrangement = true
    }
}
