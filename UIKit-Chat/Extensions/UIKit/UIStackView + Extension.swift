//
//  UIStackView + Extension.swift
//  UIKit-Chat
//
//  Created by Kalabishka Ivan on 03.12.2021.
//

import UIKit

extension UIStackView {

    //    convenience init - расширение инициализатора
    // делаем универсальный инициализатор для стеквью
    convenience init(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.spacing = spacing
    }

}
