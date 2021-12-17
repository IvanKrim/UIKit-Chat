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
        isShadow: Bool? = true,
        cornerRadius: CGFloat = 10
    ) {
        self.init(type: .system)
        
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        self.titleLabel?.font = font
        
        self.layer.cornerRadius = cornerRadius
        
        // настройка теней для кнопки
        if isShadow ?? false {
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowRadius = 4
            self.layer.shadowOpacity = 0.2
            self.layer.shadowOffset = CGSize(width: 0, height: 4)
        }
    }
    
    func customizedGoogleButton() {
        let googleLogo = UIImageView(image: #imageLiteral(resourceName: "googleLogo"), contentMode: .scaleAspectFit)
        googleLogo.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(googleLogo)
        googleLogo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24).isActive = true
        googleLogo.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}
