//
//  UILabel + Extension.swift
//  UIKit-Chat
//
//  Created by Kalabishka Ivan on 03.12.2021.
//

import UIKit

extension UILabel {

    convenience init(text: String, font: UIFont? = .arial20()) {
        self.init()

        self.text = text
        self.font = font
    }
}
