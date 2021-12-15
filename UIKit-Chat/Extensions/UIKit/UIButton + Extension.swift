//
//  UIButton + Extension.swift
//  UIKit-Chat
//
//  Created by Kalabishka Ivan on 03.12.2021.
//

import Foundation
import UIKit

// convenient initialization
extension UIButton {
    // кастомный инициализатор
    convenience init(
        title: String,
        titleColor: UIColor,
        backgroundColor: UIColor,
        font: UIFont? = .arial20(),
        isShadow: Bool,
        cornerRadius: CGFloat = 10
    ) {
        self.init(type: .system)

        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        self.titleLabel?.font = font

        self.layer.cornerRadius = cornerRadius

        // настройка теней для кнопки
        if isShadow {
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowRadius = 4
            self.layer.shadowOpacity = 0.2
            self.layer.shadowOffset = CGSize(width: 0, height: 4)
        }
    }
}
